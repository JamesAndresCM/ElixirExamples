defmodule Stack do
  use GenServer

  # Client
  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def push(pid, val) do
    GenServer.cast(pid, {:push, val})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server
  def init([]) do
    {:ok, []}
  end

  def handle_cast({:push, val}, state) do
    {:noreply, [val | state]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end
