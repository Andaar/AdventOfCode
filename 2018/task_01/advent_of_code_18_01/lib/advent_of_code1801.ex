defmodule AdventOfCode1801 do
  @moduledoc """
  Documentation for AdventOfCode1801.
  """

  @doc """
  Get all numbers from input file as String with a sign
  with negative or positive number at first position.

  """

  def parse_input(file_path) do
    case File.read(file_path) do
      {:error, reason} ->
        {:error, reason}
      {:ok, binary} ->
        converted =
          binary
          |> String.split("\n", trim: true)
        {:ok, converted}
    end
  end

  def add_all({:ok, list}) when is_list(list) do
    Enum.reduce(list, 0, fn(x, acc) ->
      String.to_integer(x) + acc
    end)
  end

  def add_all(_) do
    :error
  end

  def second_occurrence({:ok, list}, acc \\ {:next, 0, MapSet.new([0])}) when is_list(list) do
    result = second_occurrence_helper(list, acc)

    case result do
      {:next, _, _} ->
        second_occurrence({:ok, list}, result)
      {:ok, result} ->
        result
    end
  end

  defp second_occurrence_helper(list, tuple_acc) when is_list(list) do
    Enum.reduce_while(list, tuple_acc, fn(number, acc) ->
      {_, last, map_set} = acc
      sum = last + return_integer(number)

      if (!MapSet.member?(map_set, sum)), do: {:cont, {:next, sum, MapSet.put(map_set, sum)}},
      else: {:halt, {:ok, sum}}
    end)
  end

  defp return_integer(number) when is_integer(number) do
    number
  end

  defp return_integer(number) do
    String.to_integer(number)
  end

  defp is_expected_number(data) do
    case String.match?(data, ~r/^[+-][0-9]*$/) do
      true -> :ok
      false -> :error
    end
  end
end
