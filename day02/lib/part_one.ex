defmodule Day02.PartOne do
  @moduledoc """
  Documentation for `Day02`.
  """

  @initial {0, 0}

  def execute_command(["forward", x], {horiz, depth}), do: {horiz + x, depth}
  def execute_command(["down", x], {horiz, depth}), do: {horiz, depth + x}
  def execute_command(["up", x], {horiz, depth}), do: {horiz, depth - x}

  def execute(commands) do
    commands
    |> Enum.reduce(@initial, fn cmd, acc -> execute_command(cmd, acc) end)
    |> then(fn {horiz, depth} -> horiz * depth end)
  end

  def resolve() do
    Day02.commands_from_file("./puzzle_input.txt")
    |> execute()
  end

end
