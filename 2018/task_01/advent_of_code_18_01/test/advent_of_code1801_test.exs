defmodule AdventOfCode1801Test do
  use ExUnit.Case
  doctest AdventOfCode1801

  test "Parsing existing file." do
    assert AdventOfCode1801.parse_input("test/test_input_file.txt") == {:ok, ["+6", "-7", "+13"]}
  end

  test "Parsing file that does not exist." do
    assert AdventOfCode1801.parse_input("this_file_does_not_exists") == {:error, :enoent}
  end
end
