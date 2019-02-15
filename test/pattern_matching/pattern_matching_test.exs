defmodule PatternMatchingTest do
  use ExUnit.Case

  @data_structure %{
    "simple_field" => "Hello World!!!",
    "complex_field" => %{
      "value" => "Hello complex World!!",
      "status" => "new"
    },
    "complex_field2" => %{
      "value" => "Hello complex World two",
      "status" => "new"
    },
    "list" => [
      %{
        "value" => "incomplete",
        "status" => "incomplete"
      },
      %{
        "value" => "success",
        "status" => "success"
      }
    ]
  }
 @data_structure_empty %{
  "complex_field" => %{},
  "list" => [
    %{
      "value" => "non-success",
      "status" => "non-success"
    },
    %{
      "value" => "incomplete",
      "status" => "incomplete"
    }
  ]
 }

  test "match simple field" do
    %{ "simple_field" => simple_field } = @data_structure
    assert simple_field == "Hello World!!!"
  end

  test "match complex field" do
    assert get_value_field("complex_field", @data_structure) == "Hello complex World!!"
  end

  test "match complex empty field" do
    assert get_value_field("complex_field", @data_structure_empty) == nil
  end

  test "match success list item" do
    assert get_success_item(@data_structure["list"]) == "success"
  end

  test "match non-success list item" do
    assert get_success_item(@data_structure_empty["list"]) == nil
  end

  test "replace if new not nil" do
    assert replace_if_new_not_nil( "old", nil ) == "old"
    assert replace_if_new_not_nil( "old", "new" ) == "new"
  end

  defp get_success_item([first | rest]) do
    case first do
      %{ "status" => "success", "value" => value } -> value
      _-> get_success_item(rest)
    end
  end
  defp get_success_item([]), do: nil

  defp replace_if_new_not_nil( _old, new ) when not(is_nil(new)), do: new
  defp replace_if_new_not_nil( old, nil ), do: old

  defp get_value_field( key, map ) when is_binary(key) and is_map(map) do
    %{ ^key => value } = map
    get_value_field( value )
  end
  defp get_value_field( %{ "value" => value } ), do: value
  defp get_value_field( %{} ), do: nil

end
