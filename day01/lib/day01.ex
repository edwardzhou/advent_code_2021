defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  def resolve(:part_one) do
    File.read!("./puzzle_input.txt")
    |> sweep()
  end

  def resolve(:part_two) do
    File.read!("./puzzle_input.txt")
    |> sweep_2()
  end

  def sweep(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [prev, next] -> prev < next end)
  end

  def sweep_2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> to_sliding_window()
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [prev, next] -> prev < next end)
  end

  def to_sliding_window(depths) do
    depths
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
  end

end
