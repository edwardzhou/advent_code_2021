defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  @bits """
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
  """

  test "#sum_bits" do
    assert Day03.sum_bits(
      [
        [1, 0, 0, 1]
      ]) == {[1, 0, 0, 1], 1}

    assert Day03.sum_bits(
      [
        [1, 0, 1, 0],
        [1, 1, 1, 0],
        [1, 0, 0, 0]
      ]) == {[3, 1, 2, 0], 3}
  end

  test "#decode" do
    assert Day03.decode({[3,1,2,0], 3})
      == %{
        gamma:   10,
        epsilon: 5
      }
  end

  test "#diag should returns 198" do
    assert Day03.diag(@bits) == 198
  end

  test "#filter_for should returns 2 rows" do
    bit_lines = [
      [1, 0, 1, 0],
      [1, 1, 1, 0],
      [0, 0, 0, 1]
    ]

    assert Day03.filter_for(bit_lines, :oxygen, 0)
      == [
        [1, 0, 1, 0],
        [1, 1, 1, 0]
      ]

    assert Day03.filter_for(bit_lines, :oxygen, 1)
      == [
        [1, 0, 1, 0],
        [0, 0, 0, 1]
      ]
  end

  test "#find_oxygen_rate should return [1, 0, 1, 0]" do
    bit_lines =
      @bits
      |> Day03.parse_bits()

    assert Day03.find_oxygen_rate(bit_lines, 0)
      == [1, 0, 1, 1, 1]

  end

  test "#find_co2_rate should return [0, 0, 0, 1]" do
    bit_lines =
      @bits
      |> Day03.parse_bits()

    assert Day03.find_co2_rate(bit_lines, 0)
      == [0, 1, 0, 1, 0]
  end

  test "#diag_oxygen_co2 should return 230" do
    assert Day03.diag_oxygen_co2(@bits) == 230
  end

end
