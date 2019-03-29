defmodule CsvTransform do

  @delimiter_default "\t"

  @spec transform_file(binary(), binary()) :: [map()]
  def transform_file(path, delimiter \\ @delimiter_default) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, delimiter))
    |> transform()
  end

  @spec transform(Enumerable.t(binary())) :: [map()]
  def transform(enum) do
    header =
      Stream.take(enum, 1)
      |> Enum.to_list()
      |> List.flatten()

    Stream.drop(enum, 1)
    |> Stream.map(&transform_data_row(&1, header))
    |> Enum.to_list()
  end

  defp transform_data_row(row, header) do
    row
    |> Stream.zip(header)
    |> Stream.map(fn {v, k} -> %{k => v} end)
    |> Enum.reduce(%{}, &Map.merge/2)
  end
end
