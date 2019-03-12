defmodule CsvTransformTest do
  use ExUnit.Case

  @test_file Path.join(["test", "csv_transform", "file.csv"])
  @delimiter "\t"

  test "csv transform" do

    [header | data] = File.stream!(@test_file)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1,@delimiter))

    IO.inspect(header,label: "header")
    IO.inspect(data,label: "data")

    data
    |> Enum.map(&Enum.zip(&1,header))
    |> Enum.map(&Enum.map(&1,fn {v,k} -> %{k => v} end))
    |> Enum.map(&Enum.map_reduce(&1,%{}, &Map.merge/2))
    |> IO.inspect(label: "data2")

  end
end
