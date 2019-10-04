defmodule AdventOfCode1802 do
  @moduledoc """
  Documentation for AdventOfCode1802.
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

  def checksum({:ok, input}) when is_list(input) do
    result = Enum.reduce(input, %{two: 0, three: 0}, fn(x, acc) ->
      map =
        convert_to_map(x)
        |> letter_occurrences
      acc = Map.replace!(acc, :two, Map.get(map, :two) + Map.get(acc, :two))
      Map.replace!(acc, :three, Map.get(map, :three) + Map.get(acc, :three))
    end)

    result.two * result.three
  end

  defp letter_occurrences(map) when is_map(map) do
    map
    |>  Map.to_list
    |>  List.keysort(1)
    |>  Enum.reduce(%{two: 0, three: 0, last: 0}, fn({_, number}, acc) ->
          atom_occurrence = which_occurrence(number)
          case Map.has_key?(acc, atom_occurrence) and Map.get(acc, :last) != number do
            false ->
              acc = Map.replace!(acc, :last, number)
            true ->
              acc = Map.replace!(acc, atom_occurrence, Map.get(acc, atom_occurrence) + 1)
              Map.replace!(acc, :last, number)
          end
        end)
  end

  defp which_occurrence(int) when is_integer(int) do
    case int do
      2 -> :two
      3 -> :three
      _ -> nil
    end
  end

  defp convert_to_map(string) do
    string
    |>  String.split("", trim: true)
    |>  Enum.reduce(Map.new(), fn(char, acc) ->
          add_to_map(acc, char)
        end)
  end

  defp add_to_map(map, str) do
    atom = String.to_atom(str)
    case Map.has_key?(map, atom) do
      false ->
        Map.put_new(map, atom, 1)
      true ->
        Map.replace!(map, atom, Map.get(map, atom) + 1)
    end
  end
end
