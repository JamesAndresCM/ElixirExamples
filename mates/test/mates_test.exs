defmodule MatesTest do
  use ExUnit.Case
  doctest Mates

  test "greets the world" do
    assert Mates.hello() == :world
  end
end
