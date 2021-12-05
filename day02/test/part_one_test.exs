defmodule Day02.PartOneTest do
  use ExUnit.Case

  alias Day02.PartOne

  @commands """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """

  test "forward should increase horizontal position" do
    assert PartOne.execute_command(["forward", 5], {0, 0}) == {5, 0}
    assert PartOne.execute_command(["forward", 8], {5, 0}) == {13, 0}
  end

  test "down should increase depth" do
    assert PartOne.execute_command(["down", 3], {0, 5}) == {0, 8}
  end

  test "down should decrease depth" do
    assert PartOne.execute_command(["up", 3], {0, 5}) == {0, 2}
  end

  test "execute should return 150 for @commands" do
    actual = @commands
      |> Day02.parse_commands()
      |> PartOne.execute()
    assert actual == 150
  end
end
