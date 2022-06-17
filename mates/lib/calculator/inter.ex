defmodule Mates.Private do
  alias Mates.Operation
  def operation(%Operation{a: a, b: b, operation: op}), do: op.(a, b)
  #def operation({:sum, x, y}), do: x + y
  #def operation({:sub, x, y}), do: x - y
  #def operation({:divide, x, y}), do: div(x,y)
  #def operation({:mul, x, y}), do: x * y
end
