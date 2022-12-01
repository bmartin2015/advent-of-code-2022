defmodule DayOne do
  def run(filename) do
    input =
      filename
      |> File.read!()
      |> parse_input()


    part_one = part_one(input)
    part_two = part_two(input)

    IO.puts("""
      Part One Answer: #{part_one}
      Part Two Answer: #{part_two}
    """)
  end

  def part_one(input) do
    input
    |> List.first()
  end

  def part_two(input) do
    input
    |> Enum.take(3)
    |> Enum.sum()
  end

  defp parse_input(input) do
    input
    |> String.split("\n\n")
    |> Enum.map(fn elf ->
      elf
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Enum.sum()
    end)
    |> Enum.sort(:desc)
  end
end

DayOne.run("input.txt")
