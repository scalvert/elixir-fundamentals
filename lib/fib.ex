defmodule Fib do
  # NOTE: Enum.take([1, 2, 3, 4], -2) returns [3, 4]

  def normal(0), do: []
  def normal(1), do: [1]
  def normal(2), do: [1, 1]
  def normal(x) when x > 2 do
    result = normal(x - 1)
    [first, second] = Enum.take(result, -2)
    result ++ [first + second]
  end
  def normal(_), do: nil

  def reverse(0), do: []
  def reverse(1), do: [1]
  def reverse(2), do: [1, 1]
  def reverse(x) when x > 2 do
    result = reverse(x - 1)
    [first, second | tail] = result
    [first + second | result]
  end
  def reverse(_), do: nil
end