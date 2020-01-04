defmodule Maze.Gen.Sidewinder do
  alias Maze.Grid

  @spec on(%Grid{}) :: %Grid{}
  def on(%Grid{} = grid) do
    current_run = MapSet.new()

    %{grid: grid} =
      grid
      |> Grid.cells()
      |> Enum.reduce(
        %{
          current_run: current_run,
          grid: grid
        },
        &do_run/2
      )

    grid
  end

  defp do_run({x, y}, %{
         current_run: current_run,
         grid: %Grid{} = grid
       }) do
    current_run = MapSet.put(current_run, {x, y})

    case action(grid, {x, y}) do
      :end_run ->
        [{x, y}] = Enum.take_random(current_run, 1)
        %{current_run: MapSet.new(), grid: Grid.connect(grid, {x, y}, {x, y + 1})}

      :continue_run ->
        %{current_run: current_run, grid: Grid.connect(grid, {x, y}, {x + 1, y})}

      _ ->
        %{current_run: MapSet.new(), grid: grid}
    end
  end

  defp action(%Grid{height: height, width: width}, {x, y}) do
    cond do
      x == width - 1 && y == height - 1 ->
        :noop

      x == width - 1 ->
        :end_run

      y == height - 1 ->
        :continue_run

      true ->
        coinflip()
    end
  end

  defp coinflip do
    [result] = Enum.take_random([:end_run, :continue_run], 1)
    result
  end
end
