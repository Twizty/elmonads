defmodule ElMonads.MaybeTest do
  use ExUnit.Case
  alias ElMonads.Maybe
  doctest ElMonads

  test "maybe with lambda successfully" do
    result = Maybe.m(fn -> 1 end) |> Maybe.m(fn e -> e + 1 end) |> Maybe.get
    assert result == 2
  end

  test "maybe with value successfully" do
    result = 1 |> Maybe.m(fn e -> e + 1 end) |> Maybe.m(fn e -> e * 2 end) |> Maybe.get
    assert result == 4
  end

  test "returns error when error occures" do
    result = 1 |> Maybe.m(fn e -> nil end) |> Maybe.m(fn e -> e * 2 end) |> Maybe.get
    assert nil == result
  end

  test "makes array of lambdas" do
    result = Maybe.m(fn -> 1 end) |> Maybe.m(fn e -> e + 1 end)
    assert length(result) == 2
  end
end
