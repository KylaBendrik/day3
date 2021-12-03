defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  # test "use flipper to find episilon from gamma" do
  #   assert Day3.flip("00100") == ("11011")
  # end
  
  test "read binary number as decimal" do
    assert Day3.decimalize("10110") == 22
    assert Day3.decimalize("01001") == 9
  end
  
  test "add list of ints to empty acc" do
    assert Day3.add_digits_to_acc([1, 0, 1], []) == [1, 0, 1]
  end
  
  test "add list of ints to full acc" do
    assert Day3.add_digits_to_acc([1, 0, 1], [1, 0, 1]) == [2, 0, 2]
  end
  
  test "find answer of example data" do
    assert Day3.run("lib/input/example data.txt", :stage1) == 198
  end
  
  test "find answer of true data" do
    Day3.run("lib/input/input.txt", :stage1)
  end
end
