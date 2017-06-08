defmodule Monads.TryTest do
  use ExUnit.Case
  alias Monads.Try
  doctest Monads

  test "tries with lambda successfully" do
    result = Try.m(fn -> 1 end) |> Try.m(fn e -> e + 1 end) |> Try.get
    assert result == 2
  end

  test "tries with value successfully" do
    result = 1 |> Try.m(fn e -> e + 1 end) |> Try.m(fn e -> e * 2 end) |> Try.get
    assert result == 4
  end

  test "returns error when error occures" do
    result = 1 |> Try.m(fn e -> e/(e - 1) end) |> Try.m(fn e -> e * 2 end) |> Try.get
    assert { :error, _ } = result
  end

  test "makes array of lambdas" do
    result = Try.m(fn -> 1 end) |> Try.m(fn e -> e + 1 end)
    assert length(result) == 2
  end
end
