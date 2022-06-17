defmodule PI do
  def calculate_number(n) when n >= 2 and is_number(n) do
    do_calculate(4.0, 1.0, 1.0, 0.0, n)
  end

  def calculate_number(_), do: "Error solo numeros, y numero debe ser mayor o igual a 2"

  defp do_calculate(_numerator, _denominator, _operation, pi, n) when n < 1, do: IO.puts(pi)

  defp do_calculate(numerator, denominator, operation, pi, n) do
    pi_val = pi + operation * (numerator / denominator)
    denominator_val = denominator + 2.0
    operation_val = operation * -1.0
    do_calculate(numerator, denominator_val, operation_val, pi_val, n - 1)
  end
end

defmodule Main do
  PI.calculate_number(100_000_000)
end
