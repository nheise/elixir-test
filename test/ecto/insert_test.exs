defmodule MyEctoTest.InsertTest do
  use ExUnit.Case

  @tag timeout: 70_000, external: true
  test "insert into postgres" do
    Stream.flat_map(1..240_000, fn x -> [%{value: x}] end )
    |> Stream.map(&MyEctoTest.Item.changeset_new(%MyEctoTest.Item{}, &1))
    # |> Flow.from_enumerable()
    # |> Flow.each(fn x ->
    #   MyEctoTest.Item.save(x)
    #   # :timer.sleep(1000)
    # end)
    |> Enum.to_list()
    |> Enum.each(fn x ->
      MyEctoTest.Item.save(x)
      # :timer.sleep(1000)
    end)
  end
end
