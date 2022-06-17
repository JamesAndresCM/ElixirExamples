defmodule ConcurrencyFetchApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    #children = [
      # Starts a worker by calling: ConcurrencyFetchApi.Worker.start_link(arg)
    #  {ConcurrencyFetchApi.PokeApiWorker, %{}}
    #]
    children = get_children()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ConcurrencyFetchApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp get_children do
    Enum.map([:pikachu, :charizard, :ponyta, :charmander, :squirtle, :blastoise], fn(name) -> 
      Supervisor.child_spec({ConcurrencyFetchApi.PokeApiWorker, %{name: name}}, id: name) 
    end)
  end
end
