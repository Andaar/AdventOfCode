defmodule AdventOfCode1901 do

  def test_part_1() do
    "input/aoc_input_19_01_01.txt"
    |> part_1
  end

  def test_part_2() do
    "input/aoc_input_19_01_02.txt"
    |> part_2
  end

  def part_1(input_file) when is_bitstring(input_file) do
    input_file
    |> File.read()
    |> to_integer_list()
    |> part_1_sum()
  end

  def part_2(input_file) when is_bitstring(input_file) do
    input_file
    |> File.read()
    |> to_integer_list()
    |> part_2_sum()
  end

  defp part_2_sum(list) when is_list(list) do
    list
    |> Enum.reduce(0, fn(elem, acc) ->
      acc + part_2_formula(elem)
    end)
  end

  defp part_2_formula(elem) when is_integer(elem) or is_float(elem) do
    new_value = Float.floor(elem/3) - 2

    case new_value > 0 do
      true ->
        new_value + part_2_formula(new_value)
      false ->
        0
    end

  end

  defp part_1_sum(list) when is_list(list) do
    list
    |> Enum.reduce(0, fn(elem, acc) ->
      acc + part_1_formula(elem)
    end)
  end

  defp part_1_formula(elem) when is_integer(elem) do
    Float.floor(elem/3) - 2
  end

  defp to_integer_list({:ok, data}) when is_bitstring(data) do
    data
    |> String.split("\n")
    |> Enum.reduce([], fn(elem, acc) ->
        acc ++ [String.to_integer(elem)]
      end)
  end
end
