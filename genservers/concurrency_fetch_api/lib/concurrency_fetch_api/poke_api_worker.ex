defmodule ConcurrencyFetchApi.PokeApiWorker do
  use GenServer

  def start_link(args) do
    name = Map.get(args, :name)
    GenServer.start_link(__MODULE__, args, name: name)
  end

  def init(state) do
    schedule_api_fetch()
    {:ok, state}
  end

  def handle_info(:poke_api_fetch, state) do
    updated_state = state |> Map.get(:name) |> search_pokemon() |> updated_state(state)

    if updated_state[:name] != state[:name] do
      IO.inspect("Current pokemon is: #{updated_state[:name]} and url: #{updated_state[:url]}")
    end

    schedule_api_fetch()
    {:noreply, updated_state}
  end

  defp search_pokemon(name) do
    name = if is_atom(name), do: name, else: name |> String.to_atom()

    name
    |> Atom.to_string()
    |> url()
    |> HTTPoison.get!()
    |> Map.get(:body)
    |> Jason.decode!()
    |> Map.get("forms")
    |> List.first()
  end

  defp url(name) do
    "https://pokeapi.co/api/v2/pokemon/#{name}"
  end

  defp updated_state(%{"name" => name, "url" => url}, existing_state) do
    Map.merge(existing_state, %{name: name, url: url})
  end

  defp schedule_api_fetch do
    Process.send_after(self(), :poke_api_fetch, 1_000)
  end
end
