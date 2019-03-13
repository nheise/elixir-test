defmodule CsvTransform do

  @delimiter "\t"

  @spec transform( binary() ) :: [map()]
  def transform(path) do

    [header | data] = File.stream!(path)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&String.split(&1, @delimiter))

    Enum.map(data, &transform_data_row( &1, header ))
  end

  defp transform_data_row( row, header ) do
    row
    |> Enum.zip(header)
    |> Enum.map(fn {v,k} -> %{k => v} end)
    |> Enum.reduce(%{}, &Map.merge/2)
  end

end
