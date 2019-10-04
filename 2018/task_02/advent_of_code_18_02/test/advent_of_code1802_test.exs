defmodule AdventOfCode1802Test do
  use ExUnit.Case
  doctest AdventOfCode1802

  test "first part of task_02 test 1" do
    input = {:ok, ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab"]}
    assert AdventOfCode1802.checksum(input) == 12
  end

  test "first part - test 2" do
    input = {:ok, ["abcdef"]}
    assert AdventOfCode1802.checksum(input) == 0
  end

  test "first part - test 3" do
    input = {:ok, ["abcdef", "bababc"]}
    assert AdventOfCode1802.checksum(input) == 1
  end

  test "first part - test 4" do
    input = {:ok, ["abcdef", "bababc", "abbcde"]}
    assert AdventOfCode1802.checksum(input) == 2
  end

  test "first part - test 5" do
    input = {:ok, ["abcdef", "bababc", "abbcde", "abcccd"]}
    assert AdventOfCode1802.checksum(input) == 4
  end

  test "first part - test 6" do
    input = {:ok, ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd"]}
    assert AdventOfCode1802.checksum(input) == 6
  end

  test "get value" do
    input = AdventOfCode1802.parse_input("files/input1.txt")
    assert AdventOfCode1802.checksum(input) == 0
  end
end
