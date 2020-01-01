defmodule Maze.Gen.Sidewinder do
  alias Maze.Grid

  def on(%Grid{row_count: row_count, column_count: column_count} = grid) do
    current_run = MapSet.new()
    cells = for r <- 0..(row_count - 1), c <- 0..(column_count - 1), do: {r, c}

    %{grid: grid} =
      cells
      |> Enum.reduce(
        %{
          current_run: current_run,
          grid: grid
        },
        &do_run/2
      )

    grid
  end

  defp do_run({row, column}, %{
         current_run: current_run,
         grid: %Grid{row_count: row_count, column_count: column_count} = grid
       }) do
    result =
      cond do
        column == column_count - 1 && row == row_count - 1 ->
          :nop

        column == column_count - 1 ->
          :heads

        row == row_count - 1 ->
          :tails

        true ->
          coinflip()
      end

    current_run = MapSet.put(current_run, {row, column})

    case result do
      :heads ->
        [{r, c}] = Enum.take_random(current_run, 1)
        %{current_run: MapSet.new(), grid: Grid.connect(grid, {r, c}, {r + 1, c})}

      :tails ->
        %{current_run: current_run, grid: Grid.connect(grid, {row, column}, {row, column + 1})}

      _ ->
        %{current_run: MapSet.new(), grid: grid}
    end
  end

  defp coinflip do
    [result] = Enum.take_random([:heads, :tails], 1)
    result
  end
end
