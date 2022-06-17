defmodule Mates.CLI do
  def start() do
    [n1, n2] = IO.gets("Entry two numbers: ") |> parse_input()
    option = IO.gets("Entry operation or q to exit (+ - * /) ") |> parse_option()
    result = operate(option, {n1, n2})
    op = "#{Atom.to_string(option)}"
    IO.puts("the result of #{n1} #{op} #{n2} is : #{result}")
    start()
  end

  defp operate(option, {n1, n2}) do
    case option do
      :+ -> Mates.sum(n1, n2)
      :- -> Mates.substraction(n1, n2)
      :* -> Mates.mult(n1, n2)
      :/ -> Mates.divi(n1, n2)
      :q -> System.halt(0)
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