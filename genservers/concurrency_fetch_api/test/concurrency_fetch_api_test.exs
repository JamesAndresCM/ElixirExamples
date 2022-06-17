defmodule ConcurrencyFetchApiTest do
  use ExUnit.Case
  doctest ConcurrencyFetchApi

  test "greets the world" do
    assert ConcurrencyFetchApi.hello() == :world
  end
end
