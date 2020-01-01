defmodule Maze.Grid do
  defstruct [:doors, :row_count, :column_count]

  alias __MODULE__

  def new(row_count \\ 4, column_count \\ 4) do
    %Grid{
      doors: MapSet.new(),
      row_count: row_count,
      column_count: column_count
    }
  end

  def connect(%Grid{doors: doors} = grid, a, b) do
    %{grid | doors: MapSet.put(doors, MapSet.new([a, b]))}
  end

  def is_connected?(%Grid{doors: doors}, a, b) do
    MapSet.member?(doors, MapSet.new([a, b]))
  end

  defp cells(rows, columns) do
    for i <- 0..(rows - 1), j <- 0..(columns - 1), do: {i, j}
  end
end
