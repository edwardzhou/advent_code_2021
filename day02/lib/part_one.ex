defmodule Day02.PartOne do
  @moduledoc """
  Documentation for `Day02`.
  """

  def resolve() do
    File.read!("./puzzle_input.txt")
    |> execute()
  end

  def execute_command(["forward", x], {horiz, depth}), do: {horiz + x, depth}
  def execute_command(["down", x], {horiz, depth}), do: {horiz, depth + x}
  def execute_command(["up", x], {horiz, depth}), do: {horiz, depth - x}

  def execute(commands) do
    commands
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [command, value] -> [command, String.to_integer(value)] end)
    |> Enum.reduce({0, 0}, fn cmd, acc -> execute_command(cmd, acc) end)
    |> then(fn {horiz, depth} -> horiz * depth end)
  end
end
