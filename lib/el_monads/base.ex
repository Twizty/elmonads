defmodule ElMonads.Base do
  defmacro __using__(_params) do
    quote do
      @spec m(function) :: [any]
      def m(f) do
        [f]
      end

      @spec m([any], function) :: [any]
      def m(computations, f) when is_list(computations) do
        computations ++ [f]
      end

      @spec m(any, function) :: [any]
      def m(v, f) do
        [v, f]
      end

      @spec get([any]) :: any
      def get(computations) do
        [h | t] = computations
        if is_function(h, 0) do
          check_errors(h.(), t)
        else
          compute(h, t)
        end
      end

      defp compute(result, []) do
        result
      end

      defp compute(acc, computations) do
        [next_computation | rest_computations] = computations

        try do
          result = next_computation.(acc)
          check_errors(result, rest_computations)
        rescue
          e -> { :error, e }
        end
      end
    end
  end
end
