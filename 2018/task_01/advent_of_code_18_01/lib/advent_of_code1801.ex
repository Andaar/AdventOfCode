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

  defp is_expected_number(data) do
    case String.match?(data, ~r/^[+-][0-9]*$/) do
      true -> :ok
      false -> :error
    end
  end
end
