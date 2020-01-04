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

  defp render(%Grid{doors: doors, width: width, height: height}) do
    doors
    |> Enum.reduce(
      Frame.init(width * 2 + 1, height * 2 + 1, RGBA.black()),
      fn %MapSet{} = door, frame ->
        # dig out the doors
        [{x1, y1}, {x2, y2}] = MapSet.to_list(door)

        Frame.push(
          frame,
          Line.init(Point.init(x1 * 2 + 1, y1 * 2 + 1), Point.init(x2 * 2 + 1, y2 * 2 + 1)),
          RGBA.white()
        )
      end
    )
  end
end
