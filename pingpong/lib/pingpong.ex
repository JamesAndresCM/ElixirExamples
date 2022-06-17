defmodule Pingpong do
  def start() do
    make_process()
    |> run() 

    init_state()

    receive do
      {:DOWN, _ref, :process, _pid, reason} -> 
        IO.puts("Process is dead ... #{Atom.to_string(reason)}")
        start()
    end
    IO.puts("game started!")
  end

  def make_process() do
    ping = spawn(Ping, :ping, [])
    pong = spawn(Pong, :pong, [])
    {ping, pong}
  end

  def run({ping, pong}) do
    send(ping, {:ping, pong})
    Process.send_after(ping, :boom, 5_000) 
    Process.monitor(ping)
    Process.monitor(pong)
  end

  def init_state() do
    case Process.whereis(:state) do
      nil -> State.start()
      _ -> nil
    end
  end
end
