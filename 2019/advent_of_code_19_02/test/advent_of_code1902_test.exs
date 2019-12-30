defmodule AdventOfCode1902Test do
  use ExUnit.Case
  doctest AdventOfCode1902

# 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
# 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
# 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
# 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.

  test "first public test" do
    assert AdventOfCode1902.part_1("test/input_test/aoc_input_19_02_01_test_01.txt", true) == 
      [2,0,0,0,99]
  end

  test "second public test" do
    assert AdventOfCode1902.part_1("test/input_test/aoc_input_19_02_01_test_02.txt", true) == 
      [2,3,0,6,99]
  end

  test "third public test" do
    assert AdventOfCode1902.part_1("test/input_test/aoc_input_19_02_01_test_03.txt", true) == 
      [2,4,4,5,99,9801]
  end

  test "fourth public test" do
    assert AdventOfCode1902.part_1("test/input_test/aoc_input_19_02_01_test_04.txt", true) == 
      [30,1,1,4,2,5,6,0,99]
  end

  test "final data test" do
    assert Enum.at(AdventOfCode1902.part_1("input/aoc_input_19_02_01.txt"), 0) == 10566835
  end
end
