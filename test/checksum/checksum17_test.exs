defmodule Checksum17Test do
  use ExUnit.Case

  test "digit sum" do
    assert Checksum17.digit_sum(1) == 1
    assert Checksum17.digit_sum(2) == 2
    assert Checksum17.digit_sum(3) == 3
    assert Checksum17.digit_sum(4) == 4
    assert Checksum17.digit_sum(5) == 5
    assert Checksum17.digit_sum(6) == 6
    assert Checksum17.digit_sum(7) == 7
    assert Checksum17.digit_sum(8) == 8
    assert Checksum17.digit_sum(9) == 9
    assert Checksum17.digit_sum(10) == 1
    assert Checksum17.digit_sum(11) == 2
    assert Checksum17.digit_sum(12) == 3
    assert Checksum17.digit_sum(13) == 4
    assert Checksum17.digit_sum(14) == 5
    assert Checksum17.digit_sum(15) == 6
    assert Checksum17.digit_sum(16) == 7
    assert Checksum17.digit_sum(17) == 8
    assert Checksum17.digit_sum(18) == 9
    assert Checksum17.digit_sum(19) == 1
    assert Checksum17.digit_sum(20) == 2
    assert Checksum17.digit_sum(21) == 3
    assert Checksum17.digit_sum(22) == 4
    assert Checksum17.digit_sum(222222) == 3
  end
end
