defmodule DayTwo.PartOne do
  @x_value 1
  @y_value 2
  @z_value 3

  @win_value 6
  @draw_value 3
  @loss_value 0

  # A, X -> Rock
  # B, Y -> Paper
  # C, Z -> Sisscors

  def run(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [elf, you] ->
      choice_value(you) + outcome(elf, you)
    end)
    |> Enum.sum()
  end

  defp choice_value("X"), do: @x_value
  defp choice_value("Y"), do: @y_value
  defp choice_value("Z"), do: @z_value

  defp outcome("A", "X"), do: @draw_value
  defp outcome("A", "Y"), do: @win_value
  defp outcome("A", "Z"), do: @loss_value
  defp outcome("B", "Y"), do: @draw_value
  defp outcome("B", "Z"), do: @win_value
  defp outcome("B", "X"), do: @loss_value
  defp outcome("C", "Z"), do: @draw_value
  defp outcome("C", "X"), do: @win_value
  defp outcome("C", "Y"), do: @loss_value
end

IO.inspect(DayTwo.PartOne.run("input.txt"))
