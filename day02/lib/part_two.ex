defmodule Day02.PartTwo do

  def execute_command(["down", x], {horiz, depth, aim}), do: {horiz, depth, aim + x}
  def execute_command(["up", x], {horiz, depth, aim}), do: {horiz, depth, aim - x}
  def execute_command(["forward", x], {horiz, depth, aim}), do: {horiz + x, depth + aim * x, aim}

  def execute(commands) do
    commands
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [command, value] -> [command, String.to_integer(value)] end)
    |> Enum.reduce({0, 0, 0}, fn cmd, acc -> execute_command(cmd, acc) end)
    |> then(fn {horiz, depth, _} -> horiz * depth end)
  end

  def resolve do
    File.read!("./puzzle_input.txt")
    |> execute()
  end
end
