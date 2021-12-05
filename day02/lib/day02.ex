defmodule Day02 do
  def commands_from_file(filename) do
    filename
    |> File.read!()
    |> parse_commands()
  end

  def parse_commands(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [command, value] -> [command, String.to_integer(value)] end)
  end
end
