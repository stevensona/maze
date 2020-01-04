defmodule Maze.Grid do
  defstruct [:doors, :width, :height]

  alias __MODULE__

  def new(width \\ 4, height \\ 4) do
    %Grid{
      doors: MapSet.new(),
      width: width,
      height: height
    }
  end

  def connect(%Grid{doors: doors} = grid, a, b) do
    %{grid | doors: MapSet.put(doors, MapSet.new([a, b]))}
  end

  def is_connected?(%Grid{doors: doors}, a, b) do
    MapSet.member?(doors, MapSet.new([a, b]))
  end

  def cells(%Grid{width: width, height: height}) do
    for y <- 0..(height - 1), x <- 0..(width - 1), do: {x, y}
  end
end
