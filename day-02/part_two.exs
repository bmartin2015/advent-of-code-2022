defmodule DayTwo.PartTwo do
  @a_value 1
  @b_value 2
  @c_value 3

  @win_value 6
  @draw_value 3
  @loss_value 0

  # X -> lose
  # Y -> darw
  # Z -> win
  # A -> Rock
  # B -> Paper
  # C -> Sisscors

  def run(filename) do
    filename
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn [elf, you] ->
      outcome_value(you) + choice_value(elf, you)
    end)
    |> Enum.sum()
  end

  defp outcome_value("X"), do: @loss_value
  defp outcome_value("Y"), do: @draw_value
  defp outcome_value("Z"), do: @win_value

  defp choice_value("A", "X"), do: @c_value
  defp choice_value("B", "X"), do: @a_value
  defp choice_value("C", "X"), do: @b_value

  defp choice_value("A", "Y"), do: @a_value
  defp choice_value("B", "Y"), do: @b_value
  defp choice_value("C", "Y"), do: @c_value

  defp choice_value("A", "Z"), do: @b_value
  defp choice_value("B", "Z"), do: @c_value
  defp choice_value("C", "Z"), do: @a_value
end

IO.inspect(DayTwo.PartTwo.run("input.txt"))
