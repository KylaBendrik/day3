defmodule Day3.LifeSupport do
  defstruct type: "", answer: []
  
  def list_from_file(filename) do
    {:ok, input} = File.read(filename)
    list_of_lists_from_text(input)
  end
  
  def list_of_lists_from_text(input) do
    input
    |> String.split(["\r", "\n", "\r\n"], trim: true) 
    |> Enum.map(fn x -> String.graphemes(x) end)
  end
  
  def run(_filename) do
    # _data_list_of_lists = list_from_file(filename)
    
    # find oxygen rating (most common, keep values with 1 if tie)
    # # find CO2 rating (least common, keep values with 0 if tie)
    "hello"
  end
  
  def decimal_from_list_of_strings(list_of_strings) do
    Day3.decimalize(list_of_strings)
  end
  
  def find_oxygen(list_of_lists), do: find_oxygen(list_of_lists, [])
  
  def find_oxygen(list_of_lists, answer) do
    if length(list_of_lists) == 1 do
      # decimalize answer, which should be a list
      decimal_from_list_of_strings(answer)
    else
      # find most common
      most_common = find_most_common(list_of_lists, 1)
      IO.puts("most_common: #{most_common}")
      # add good ones to next list_of_lists (with the first bit reomved)
      new_list_of_lists = filter_list(list_of_lists, most_common)
      
      find_oxygen(new_list_of_lists, answer ++ [most_common])
    end
  end
  
  def filter_list(list_of_lists, filter_by), do: filter_list(list_of_lists, filter_by, [])
  
  def filter_list([], _filter_by, new_list), do: new_list
  
  def filter_list([first_entry | other_entries], filter_by, new_list) do
    [first_bit | other_bits] = first_entry
    
    cond do
      first_bit == filter_by -> filter_list(other_entries, filter_by, new_list ++ other_bits)
      true -> filter_list(other_entries, filter_by, new_list)
    end
  end
  
  # Generate acc
  def find_most_common(list_of_lists, favorite), do: find_most_common(list_of_lists, favorite, %{ones: 0, zeros: 0})
  
  # All done, send back the answer
  def find_most_common([], favorite, %{ones: ones, zeros: zeros}) do
    IO.inspect(%{ones: ones, zeros: zeros})
    cond do
      ones > zeros -> "1"
      zeros > ones -> "0"
      ones == zeros ->
        case favorite do
          1 -> "1"
          0 -> "0"
        end
    end
  end
  
  # Loop through list. Find most common for the first bit.
  def find_most_common([first_entry | other_entries], favorite, acc) do
    find_most_common(other_entries, favorite, add_to_acc(first_entry, acc))
  end
  
  defp add_to_acc([first | _rest], %{ones: ones, zeros: zeros}) do
    case first do
      "1" -> %{ones: ones + 1, zeros: zeros}
      "0" -> %{ones: ones, zeros: zeros + 1}
    end
  end
  
  defp add_to_acc(digit, %{ones: ones, zeros: zeros}) when is_bitstring(digit) do
    case digit do
      "1" -> %{ones: ones + 1, zeros: zeros}
      "0" -> %{ones: ones, zeros: zeros + 1}
    end
  end
  
end
