defmodule ElMonads.Try do
  use ElMonads.Base
  @moduledoc """
  This is `Try` monad. It contains 2 public methods: `m` and `get`.
  Use `m` method to combain your actions:
  `result = Try.m(fn -> foo() end) |> Try.m(fn e -> bar(e) end) |> Try.get`.
  It'll pass the result of your actions to `result`.
  If any function return or raise error, `result` will be nil.
  """

  defp check_errors(result, rest_computations) do
    case result do
      { :error, e } -> { :error, e }
      _ -> compute(result, rest_computations)
    end
  end
end
