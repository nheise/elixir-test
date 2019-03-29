defmodule WP do
  def read() do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1," "))
    |> Stream.concat()
    |> Stream.transform(%{}, &count/2)
    |> Enum.each(&IO.inspect(&1,label: "input"))
  end

  defp count(elem, acc) do
    case Map.get(acc, elem, 0) do
      counter -> {[{elem, counter+1}], Map.put(acc, elem, counter+1)}
    end
  end
end

WP.read()
# elixir lib/stdin/wp.exs < lib/stdin/data.txt
