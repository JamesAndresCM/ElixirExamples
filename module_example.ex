defmodule Mates do
  def sum(x, y) do
    operation({:sum, x, y})
  end

  def substraction(x, y) do
    operation({:sub, x, y})
  end

  def divi(x, y) when x > 0 and y > 0 do 
    operation({:divide, x, y})
  end

  def mult(x, y) do
    operation({:mul, x, y})
  end

  defp operation({:sum, x, y}), do: x + y
  defp operation({:sub, x, y}), do: x - y
  defp operation({:divide, x, y}), do: div(x,y)
  defp operation({:mul, x, y}), do: x * y

  #defp operation({op, x, y}) do
  #  case op do
  #    :sum -> x + y
  #    :sub -> x - y
  #    :divide -> div(x,y)
  #    :mul -> x * y
  #    _ -> IO.puts(:stderr, "Operation not permitted")
  #  end
  #end
end

defmodule Mates.CLI do
  def start() do
    [n1, n2] = IO.gets("Entry two numbers: ") |> parse_input()
    option = IO.gets("Entry operation (+ - * /) ") |> parse_option()
    result = operate(option, {n1, n2})
    op = "#{Atom.to_string(option)}"
    IO.puts("the result of #{n1} #{op} #{n2} is : #{result}")
  end

  defp operate(option, {n1, n2}) do
    case option do
      :+ -> Mates.sum(n1, n2)
      :- -> Mates.substraction(n1, n2)
      :* -> Mates.mult(n1, n2)
      :/ -> Mates.divi(n1, n2)
    end
  end

  defp parse_option(str) do
    str 
    |> String.trim()
    |> String.to_atom()
  end

  defp parse_input(str) do
    str
    |> String.split(" ")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.to_integer/1)
  end
end
Mates.CLI.start()
