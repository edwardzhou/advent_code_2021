defmodule Day02.PartTwo do

  @initial {0, 0, 0}

  def execute_command(["down", x], {horiz, depth, aim}), do: {horiz, depth, aim + x}
  def execute_command(["up", x], {horiz, depth, aim}), do: {horiz, depth, aim - x}
  def execute_command(["forward", x], {horiz, depth, aim}), do: {horiz + x, depth + aim * x, aim}

  def execute(commands) do
    commands
    |> Enum.reduce(@initial, fn cmd, acc -> execute_command(cmd, acc) end)
    |> then(fn {horiz, depth, _} -> horiz * depth end)
  end

  def resolve do
    Day02.commands_from_file("./puzzle_input.txt")
    |> execute()
  end
end
