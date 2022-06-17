defmodule Mates do
  alias Mates.Operation
  import Mates.Private, only: [operation: 1]
  @moduledoc """
  Documentation for `Mates`.

  ## Examples

      iex> Mates.sum(1, 2)
      3

  """
  def sum(x, y) do
    operation(%Operation{a: x, b: y, operation: &+/2})
  end

  def substraction(x, y) do
    operation(%Operation{a: x, b: y, operation: &-/2})
  end

  def divi(x, y) when x > 0 and y > 0 do 
    operation(%Operation{a: x, b: y, operation: &div/2})
  end

  def mult(x, y) do
    operation(%Operation{a: x, b: y, operation: &*/2})
  end
end
