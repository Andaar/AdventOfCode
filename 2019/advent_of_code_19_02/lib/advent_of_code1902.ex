defmodule AdventOfCode1902 do
  def test_part_1() do
    part_1("input/aoc_input_19_02_01.txt")
  end

  def part_1(input_file, tests \\ false) when is_bitstring(input_file) do
    input_file
    |> File.read()
    |> to_integer_list()
    |> list_replace(tests)
  end

  defp list_replace(list, tests \\ false) do
    list = list_replace_before_run(list, tests)
    list_replace(:next_step, list, 0)
  end

  defp list_replace(:end, list, _) do
    list
  end

  defp list_replace(:next_step, list, index) do
    operation_type = 
      list
      |> Enum.at(index)
      |> operation_type()
    {type, list} = list_replace(operation_type, list, index + 1, index + 2, index + 3)
    list_replace(type, list, index + 4)
  end

  defp list_replace(list, index_of_elem_to_change, elem_to_change) do
    index = [Enum.at(list, index_of_elem_to_change)]
    Enum.reduce(index, list, &List.replace_at(&2,&1,elem_to_change))
  end

  defp operation_type(number) do
    cond do
      number == 1 ->
        :add
      number == 2 ->
        :multiply
      number == 99 ->
        :end
      true ->
        :error
    end
  end

  defp list_replace(:end, list, _, _, _) do
    {:end, list}
  end

  defp list_replace(:add, list, index_of_first_elem, index_of_second_elem, index_of_elem_to_change) do
    elem_to_change = get_elem(list, index_of_first_elem) + get_elem(list, index_of_second_elem)
    list = list_replace(list, index_of_elem_to_change, elem_to_change)
    {:next_step, list}
  end

  defp list_replace(:multiply, list, index_of_first_elem, index_of_second_elem, index_of_elem_to_change) do
    elem_to_change = get_elem(list, index_of_first_elem) * get_elem(list, index_of_second_elem)
    list = list_replace(list, index_of_elem_to_change, elem_to_change)
    {:next_step, list}
  end

  defp list_replace_before_run(list, false) do
    list = Enum.reduce([1], list, &List.replace_at(&2,&1,12))
    Enum.reduce([2], list, &List.replace_at(&2,&1,2))
  end

  defp list_replace_before_run(list, true) do
    list
  end

  defp get_elem(list, index) do
    Enum.at(list, Enum.at(list, index))
  end

  defp to_integer_list({:ok, data}) when is_bitstring(data) do
    data
    |> String.split(",")
    |> Enum.reduce([], fn(elem, acc) ->
        acc ++ [String.to_integer(elem)]
      end)
  end
end
