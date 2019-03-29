defmodule CsvTransformTest do
  use ExUnit.Case

  @test_file Path.join(["test", "csv_transform", "file.csv"])
  @check_map [
    %{"Zeile 1" => "Wert1 1", "Zeile 2" => "Wert12", "Zeile 3" => "Wert13"},
    %{"Zeile 1" => "Wert21", "Zeile 2" => "2.278", "Zeile 3" => "2,93"}
  ]

  test "csv transform" do

    map = CsvTransform.transform_file(@test_file)

    assert map === @check_map
  end
end
