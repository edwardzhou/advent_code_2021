defmodule Day03 do
  @moduledoc """
  Documentation for `Day03`.
  """

  def sum_bits([first_line | _] = lines) do
    initial_bits = List.duplicate(0, Enum.count(first_line))

    lines
    |> Enum.reduce(initial_bits, fn line, acc ->
        Enum.zip_with(acc, line, fn x, y -> x + y end)
      end)
    |> then(& {&1, Enum.count(lines)} )
  end

  def decode({bits, line_count}) do
    half = div(line_count, 2)
    bits
    |> Enum.reverse()
    |> Enum.reduce( %{gamma: [], epsilon: []}, fn bit_sum, acc ->
          if bit_sum > half do
            %{acc | gamma: [1 | acc.gamma], epsilon: [0 | acc.epsilon]}
          else
            %{acc | gamma: [0 | acc.gamma], epsilon: [1 | acc.epsilon]}
          end
        end)
    |> then(fn %{gamma: gamma, epsilon: epsilon} ->
        %{
          gamma: bits_to_integer(gamma),
          epsilon: bits_to_integer(epsilon)
        }
      end)
  end

  def bits_to_integer(bits) do
    bits
    |> Enum.join("")
    |> String.to_integer(2)
  end

  def to_bit_list(line) do
    line
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def parse_bits(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&to_bit_list/1)
  end

  def diag(input) do
    input
    |> parse_bits()
    |> sum_bits()
    |> decode()
    |> calculate()
  end

  def filter_for(bit_lines, :oxygen, bit_index) do
    {bit_sum, count} = sum_bits(bit_lines)
    bit_1_count = Enum.at(bit_sum, bit_index)

    bit_to_keep = case bit_1_count >= count - bit_1_count do
      true -> 1
      _ -> 0
    end

    bit_lines
    |> Enum.filter(fn line -> Enum.at(line, bit_index) == bit_to_keep end)
  end

  def filter_for(bit_lines, :co2, bit_index) do
    {bit_sum, count} = sum_bits(bit_lines)

    bit_1_count = Enum.at(bit_sum, bit_index)

    bit_to_keep = case bit_1_count >= count - bit_1_count  do
      true -> 0
      _ -> 1
    end

    bit_lines
    |> Enum.filter(fn line -> Enum.at(line, bit_index) == bit_to_keep end)
  end


  def find_oxygen_rate([line1, line2], bit_index) do
    if Enum.at(line1, bit_index) == 1 do
      line1
    else
      line2
    end
  end

  def find_oxygen_rate(bit_lines, bit_index) do
    bits = bit_lines |> List.first |> Enum.count()
    bit_index = rem(bit_index, bits)

    filter_for(bit_lines, :oxygen, bit_index)
    |> find_oxygen_rate(bit_index + 1)
  end

  def find_co2_rate([line1, line2], bit_index) do
    if Enum.at(line1, bit_index) == 0 do
      line1
    else
      line2
    end
  end

  def find_co2_rate(bit_lines, bit_index) do
    bits = bit_lines |> List.first |> Enum.count()
    bit_index = rem(bit_index, bits)

    filter_for(bit_lines, :co2, bit_index)
    |> find_co2_rate(bit_index + 1)
  end

  def calculate(%{gamma: gamma, epsilon: epsilon}), do: gamma * epsilon

  def diag_oxygen_co2(input) do
    bit_lines =
      input |> parse_bits()

    oxygen_rate = find_oxygen_rate(bit_lines, 0) |> bits_to_integer()
    co2_rate = find_co2_rate(bit_lines, 0) |> bits_to_integer()

    oxygen_rate * co2_rate
  end

  def resolve(:part_one) do
    File.read!("./puzzle_input.txt")
    |> diag()
  end

  def resolve(:part_two) do
    File.read!("./puzzle_input.txt")
    |> diag_oxygen_co2()
  end
end
