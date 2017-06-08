defmodule ElMonads.Maybe do
  use ElMonads.Base
  @moduledoc """
  This is `Maybe` monad. It contains 2 public methods: `m` and `get`.
  Use `m` method to combain your actions:
  `result = Maybe.m(fn -> foo() end) |> Maybe.m(fn e -> bar(e) end) |> Maybe.get`.
  It'll pass the result of your actions to `result`.
  If any function return nil, `result` will be nil.
  """

  defp check_errors(result, rest_computations) do
    case result do
      nil -> nil
      _ -> compute(result, rest_computations)
    end
  end
end
