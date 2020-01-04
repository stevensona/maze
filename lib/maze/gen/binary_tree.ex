defmodule Maze.Gen.BinaryTree do
  alias Maze.Grid

  @spec on(%Grid{}) :: %Grid{}
  def on(%Grid{} = grid) do
    grid |> Grid.cells() |> Enum.reduce(grid, &connect_to_random_neighbor/2)
  end

  defp connect_to_random_neighbor({x, y}, grid) do
    neighbors = []
    neighbors = if x < grid.width - 1, do: [{x + 1, y} | neighbors], else: neighbors

    neighbors = if y < grid.height - 1, do: [{x, y + 1} | neighbors], else: neighbors

    case Enum.take_random(neighbors, 1) do
      [{dest_x, dest_y}] ->
        Grid.connect(grid, {x, y}, {dest_x, dest_y})

      [] ->
        grid
    end
  end
end
