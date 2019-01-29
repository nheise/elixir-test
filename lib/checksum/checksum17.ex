defmodule Checksum17 do

  @weights [1, 2, 1, 2, 1, 2]

  def calc( number ) when is_integer(number) do
    number
    |> Integer.digits()
    |> calc()
  end

  def calc( numbers ) when is_list(numbers) do
    numbers
    |> Enum.zip(@weights)
    |> Enum.map(fn {a, b} -> a * b end)
    |> Enum.reduce(0, fn x, acc -> digit_sum( x + acc) end )
    |> (fn x -> x - 1 end).()
  end

  def digit_sum(number) when is_integer(number) and number > 9 do
    number
    |> Integer.digits()
    |> Enum.reduce(0, fn x, acc -> x + acc end)
    |> digit_sum()
  end
  def digit_sum(number), do: number
end
