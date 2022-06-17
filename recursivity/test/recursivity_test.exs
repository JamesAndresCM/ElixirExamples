defmodule RecursivityTest do
  use ExUnit.Case
  doctest Recursivity

  test "greets the world" do
    assert Recursivity.hello() == :world
  end
end
