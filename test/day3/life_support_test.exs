defmodule Day3.LifeSupportTest do
  use ExUnit.Case
  doctest Day3.LifeSupport

  test "list of lists from text" do
    input = """
    101
    001
    111
    001
    110
    """
    
    assert Day3.LifeSupport.list_of_lists_from_text(input) == [
      ["1", "0", "1"],
      ["0", "0", "1"],
      ["1", "1", "1"],
      ["0", "0", "1"],
      ["1", "1", "0"]
    ]
  end
  
  test "list of lists of strings from example" do
    assert Day3.LifeSupport.list_from_file("lib/input/example data.txt") == [
      ["0", "0", "1", "0", "0"],
      ["1", "1", "1", "1", "0"],
      ["1", "0", "1", "1", "0"],
      ["1", "0", "1", "1", "1"],
      ["1", "0", "1", "0", "1"],
      ["0", "1", "1", "1", "1"],
      ["0", "0", "1", "1", "1"],
      ["1", "1", "1", "0", "0"],
      ["1", "0", "0", "0", "0"],
      ["1", "1", "0", "0", "1"],
      ["0", "0", "0", "1", "0"],
      ["0", "1", "0", "1", "0"]
    ]
  end
  
  test "find_most_common first bit of example" do
    list_of_lists = Day3.LifeSupport.list_from_file("lib/input/example data.txt")
    
    assert Day3.LifeSupport.find_most_common(list_of_lists, 1) == "1"
  end
  
  test "integer from list of strings" do
    input = ["1", "0", "1"]
    
    assert Day3.LifeSupport.decimal_from_list_of_strings(input) == 5
  end
  
  test "find oxygen of example" do
    list_of_lists = Day3.LifeSupport.list_from_file("lib/input/example data.txt")
    assert Day3.LifeSupport.find_oxygen(list_of_lists) == 23
  end
end
