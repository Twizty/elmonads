defmodule Monads.Try do
  use Monads.Base

  defp check_errors(result, rest_computations) do
    case result do
      { :error, e } -> { :error, e }
      _ -> compute(result, rest_computations)
    end
  end
end
