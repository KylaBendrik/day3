defmodule Day3 do
  @moduledoc """
  Documentation for `Day3`.
  """
  
  def run(filename, :stage1) do
    gamma = list_from_file(filename)
    |> find_gamma
    gamma_dec = decimalize(gamma)
    # IO.puts("gamma: #{gamma}, #{gamma_dec}")
    epsilon = flip(gamma)
    epsilon_dec = decimalize(epsilon)
    # IO.puts("gamma: #{epsilon}, #{epsilon_dec}")
    answer = gamma_dec * epsilon_dec
    # IO.puts("answer: #{answer}")
    answer
  end
  
  def list_from_file(filename) do
    {:ok, input} = File.read(filename)
    String.split(input, ["\r", "\n", "\r\n"], trim: true)
  end
  
  
  defp one_or_zero(digit, list_length) do
    half_length = list_length / 2
    cond do
      digit >=half_length -> "1"
      digit < half_length -> "0"
    end
  end
  
  def find_gamma(list) do
    length = length(list)
    find_gamma(list, []) |>
    Enum.map(fn x -> one_or_zero(x, length) end)
  end
  
  
  def find_gamma([], acc) do
    acc
  end
  
  def find_gamma([first_entry | rest], acc) do
    digit_list = first_entry 
    |> String.graphemes
    |> Enum.map(fn x -> String.to_integer(x) end)
    # now we have a list of ints [1, 0, 0, 1, 1]
    # acc is a list of ints that gets bigger. 
    find_gamma(rest, add_digits_to_acc(digit_list, acc))
  end
  
  def add_digits_to_acc([], []) do
    []
  end
  
  
  def add_digits_to_acc(digit_list, []) do
    digit_list
  end

  def add_digits_to_acc([first_digit | other_digits], [first_acc | other_acc]) do
    [first_acc + first_digit | add_digits_to_acc(other_digits, other_acc)]
  end

  def flip(gamma) do
    gamma
    # |> String.graphemes()
    |> Enum.map(fn x -> flipchar(x) end)
    |> Enum.join("")
  end
  
  defp flipchar(char) do
    case char do
      "0" -> "1"
      "1" -> "0"
    end
  end
  
  def decimalize(num_string) when is_bitstring(num_string) do
    num_list = num_string 
    |> String.graphemes()
    |> Enum.map(fn x -> String.to_integer(x) end)
    
    convert_to_decimal(num_list)
    
  end
  
  def decimalize(num_string) when is_list(num_string) do
    num_list = num_string 
    |> Enum.map(fn x -> String.to_integer(x) end)
    
    convert_to_decimal(num_list)
    
  end
  
  defp convert_to_decimal(list) do
    convert_to_decimal(list, 0)
  end
  defp convert_to_decimal(list, acc) do
    length = length(list)
    [biggest | rest] = list
    cond do
      length == 1 -> acc + biggest
      length > 1 -> 
        addend = trunc(:math.pow(2, length - 1) * biggest)
        convert_to_decimal(rest, acc + addend)
    end
  end
end
