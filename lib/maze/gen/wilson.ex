defmodule Maze.Gen.Wilson do
  alias Maze.Grid

  @spec on(%Grid{}) :: %Grid{}
  def on(%Grid{} = grid) do
    [position] = Enum.take_random(Grid.cells(grid), 1)
    remaining = grid |> Grid.cells() |> MapSet.new() |> MapSet.delete(position)
    random_walk(grid, remaining, position)
  end

  defp random_walk(%Grid{} = grid, remaining, position) do
    case MapSet.size(remaining) do
      0 ->
        grid

      _ ->
        next_cell = get_next_cell(grid, position)
        next_grid = get_next_grid(grid, remaining, position, next_cell)
        random_walk(next_grid, MapSet.delete(remaining, next_cell), next_cell)
    end
  end

  defp get_next_grid(%Grid{} = grid, remaining, position, next_cell) do
    if Enum.member?(remaining, next_cell) do
      Grid.connect(grid, position, next_cell)
    else
      grid
    end
  end

  defp get_next_cell(%Grid{width: width, height: height}, position) do
    [:up, :down, :left, :right]
    |> Enum.map(&translate_direction(&1, position))
    |> Enum.filter(&inbounds?(&1, width, height))
    |> Enum.take_random(1)
    |> Enum.at(0)
  end

  defp translate_direction(:up, {x, y}), do: {x, y + 1}
  defp translate_direction(:left, {x, y}), do: {x - 1, y}
  defp translate_direction(:right, {x, y}), do: {x + 1, y}
  defp translate_direction(:down, {x, y}), do: {x, y - 1}

  defp inbounds?({x, y}, width, height) do
    x >= 0 && y >= 0 && x < width && y < height
  end
end
