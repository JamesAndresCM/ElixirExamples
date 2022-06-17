defmodule Mates.Operation do
  @enforce_keys [:a, :b, :operation]
  defstruct [:operation, a: 0, b: 0]
end
