defmodule ListUtils do
  # Exercise 7
  def reduce([], _reducer, accumulator), do: accumulator
  def reduce([h|t], reducer, accumulator) do
    reduce(t, reducer, reducer.(h, accumulator))
  end

  def map([], transform_fn, transformed), do: Enum.reverse(transformed)
  def map([h|t], transform_fn, transformed \\ []) do
    updated = [transform_fn.(h) | transformed]
    map(t, transform_fn, updated)
  end

  # Exercise 8
  def bounds(list), do: {nil, nil}

  # Exercise 13
  def pmap(list, func) do
    # Add your exercise 13 solution here
  end
end