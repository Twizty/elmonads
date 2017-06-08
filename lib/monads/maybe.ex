defmodule Monads.Maybe do
  use Monads.Base

  defp check_errors(result, rest_computations) do
    case result do
      nil -> nil
      _ -> compute(result, rest_computations)
    end
  end
end
