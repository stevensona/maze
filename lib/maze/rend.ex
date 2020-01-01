defmodule Maze.Rend do
  use Vivid
  alias Vivid.PNG
  alias Maze.Grid

  def png(%Grid{} = grid, filename \\ "maze.png") do
    grid |> render |> PNG.to_png(filename)
  end

  def stdout(%Grid{} = grid) do
    grid |> render |> IO.puts()
  end

  defp render(%Grid{doors: doors, row_count: row_count, column_count: column_count}) do
    doors
    |> Enum.reduce(
      Frame.init(column_count * 2 + 1, row_count * 2 + 1, RGBA.black()),
      fn %MapSet{} = door, frame ->
        # dig out the doors
        [{y1, x1}, {y2, x2}] = MapSet.to_list(door)

        Frame.push(
          frame,
          Line.init(Point.init(x1 * 2 + 1, y1 * 2 + 1), Point.init(x2 * 2 + 1, y2 * 2 + 1)),
          RGBA.white()
        )
      end
    )
  end
end
