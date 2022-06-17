defmodule Mates.Application do
  use Application

  def start(_type, _args) do
    pid_calc = spawn(Mates.CLI, :start, [])
    {:ok, pid_calc} 
  end
end