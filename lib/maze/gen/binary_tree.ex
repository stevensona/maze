defmodule Maze.Gen.BinaryTree do
  alias Maze.Grid

  def on(%Grid{row_count: row_count, column_count: column_count} = grid) do
    cells = for r <- 0..(row_count - 1), c <- 0..(column_count - 1), do: {r, c}
    cells |> Enum.reduce(grid, &connect_to_random_neighbor/2)
  end

  defp connect_to_random_neighbor({row, column}, grid) do
    neighbors = []
    neighbors = if row < grid.row_count - 1, do: [{row + 1, column} | neighbors], else: neighbors

    neighbors =
      if column < grid.column_count - 1, do: [{row, column + 1} | neighbors], else: neighbors

    case Enum.take_random(neighbors, 1) do
      [{dest_row, dest_column}] ->
        Grid.connect(grid, {row, column}, {dest_row, dest_column})

      [] ->
        grid
    end
  end
end
