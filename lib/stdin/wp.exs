defmodule WP do
  def read() do
    IO.stream(:stdio, :line)
    |> Flow.from_enumerable()
    |> Flow.map(&String.trim/1)
    |> Flow.flat_map(&String.split(&1, " "))
    |> Flow.partition()
    |> Flow.reduce(fn -> %{} end, &count_word/2)
    |> Enum.to_list()
    |> IO.inspect(label: "words")
  end

  defp count_word(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end
end

WP.read()
# elixir lib/stdin/wp.exs < lib/stdin/data.txt
