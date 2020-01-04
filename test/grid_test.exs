defmodule GridTest do
  use ExUnit.Case, async: true
  alias Maze.Grid

  setup do
    {
      :ok,
      new_grid: %Grid{doors: MapSet.new(), width: 3, height: 2},
      connected_grid: %Grid{
        width: 3,
        height: 2,
        doors: MapSet.new([MapSet.new([{0, 0}, {1, 0}])])
      }
    }
  end

  test "new returns a properly constructed Grid", %{new_grid: grid} do
    assert Grid.new(grid.width, grid.height) == grid
  end

  test "grid cells can be connected", %{new_grid: new_grid, connected_grid: connected_grid} do
    assert Grid.connect(new_grid, {0, 0}, {1, 0}) == connected_grid
  end

  test "unconnected cells are not connected", %{new_grid: grid} do
    refute Grid.is_connected?(grid, {0, 0}, {1, 0})
  end

  test "connected cells are connected", %{connected_grid: grid} do
    assert Grid.is_connected?(grid, {0, 0}, {1, 0})
  end

  test "cells returns all cells", %{new_grid: grid} do
    assert Grid.cells(grid) == [{0, 0}, {1, 0}, {2, 0}, {0, 1}, {1, 1}, {2, 1}]
  end
end
