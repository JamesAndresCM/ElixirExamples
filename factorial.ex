defmodule Factorial do
  def calculate(n) when n == 0, do: 1

  def calculate(n) when is_integer(n) do
    n * calculate(n - 1)
  end
end

number = System.argv()
file_path = File.cwd!() |> Path.join(__ENV__.file)

case number do
  [] ->
    IO.puts(
      "pass number to calculate factorial as parameter. Example: #{__MODULE__}#{Path.basename(file_path)} 4"
    )

  [number_str | _rest] ->
    try do
      n = number_str |> String.to_integer()
      IO.puts("Factorial of #{n} is #{Factorial.calculate(n)}\n")

      1..n
      |> Enum.map(fn x -> "Factorial of #{x} is #{Factorial.calculate(x)}" end)
      |> Enum.join("\n")
      |> IO.puts()
    rescue
      _ ->
        IO.puts("#{number_str} is not a valid number")
    end
end
