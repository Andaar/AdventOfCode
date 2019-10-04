defmodule AdventOfCode1801Test do
  use ExUnit.Case
  doctest AdventOfCode1801

  test "Parsing existing file." do
    assert AdventOfCode1801.parse_input("test/test_input_file.txt") == {:ok, ["+6", "-7", "+13"]}
  end

  test "Parsing file that does not exist." do
    assert AdventOfCode1801.parse_input("this_file_does_not_exists") == {:error, :enoent}
  end

  test "second part test 1" do
    assert AdventOfCode1801.second_occurrence({:ok, ["+1", "-2", "+3", "+1"]}) == 2
  end

  test "second part test 2" do
    assert AdventOfCode1801.second_occurrence({:ok, ["+1", "-1"]}) == 0
  end

  test "second part test 3" do
    assert AdventOfCode1801.second_occurrence({:ok, ["+3", "+3", "+4", "-2", "-4"]}) == 10
  end

  test "second part test 4" do
    assert AdventOfCode1801.second_occurrence({:ok, ["-6", "+3", "+8", "+5", "-6"]}) == 5
  end

  test "second part test 5" do
    assert AdventOfCode1801.second_occurrence({:ok, ["+7", "+7", "-2", "-7", "-4"]}) == 14
  end
end
