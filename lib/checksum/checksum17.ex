defmodule Checksum17 do

  @weights [1, 2, 1, 2, 1, 2]

  @spec calc(integer) :: integer
  def calc( number ) when is_integer(number) do
    number
    |> Integer.digits()
    |> calc()
  end

  @spec calc(list(integer)) :: integer()
  def calc( numbers ) when is_list(numbers) do
    numbers
    |> Enum.zip(@weights)
    |> Enum.map(fn {a, b} -> digit_sum( a * b ) end)
    |> Enum.sum()
    |> (&(&1 - 1)).()
    |> Integer.mod(11)
    |> case do 0 -> 0; x -> 10 - x end
  end

  @spec digit_sum(integer) :: integer
  def digit_sum(number) when is_integer(number) and number > 9 do
    number
    |> Integer.digits()
    |> Enum.sum()
    |> digit_sum()
  end
  def digit_sum(number), do: number
end
