defmodule Day02.PartTwoTest do
  use ExUnit.Case

  alias Day02.PartTwo

  @commands """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """

  test "down should increase depth" do
    assert PartTwo.execute_command(["down", 3], {0, 0, 5}) == {0, 0, 8}
  end

  test "up should decrease depth" do
    assert PartTwo.execute_command(["up", 3], {0, 0, 5}) == {0, 0, 2}
  end

  test "forward should increase both horiz and depth" do
    assert PartTwo.execute_command(["forward", 2], {0, 0, 0}) == {2, 0, 0}
    assert PartTwo.execute_command(["forward", 2], {3, 0, 8}) == {5, 16, 8}
  end

  test "execute should return 900 for @commands" do
    assert PartTwo.execute(@commands) == 900
  end
end
