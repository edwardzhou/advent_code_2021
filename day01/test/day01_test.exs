defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  @depths """
  199
  200
  208
  210
  200
  207
  240
  269
  260
  263
  """

  test "sweep should count 7 times increased" do
    assert Day01.sweep(@depths) == 7
  end

  test "sweep_2 should count 5 times increases" do
    assert Day01.sweep_2(@depths) == 5
  end
end
