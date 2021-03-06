# Maze

Generate and render mazes with Elixir.
Based on material presented in [Mazes for Programmers](https://pragprog.com/book/jbmaze/mazes-for-programmers)
### Binary Tree

```
Maze.Grid.new(10,10) |> Maze.Gen.BinaryTree.on |> Maze.Rend.png("binarytree.png")
```

<img src="binarytree.png" width="210">

### Sidewinder

```
Maze.Grid.new(10,10) |> Maze.Gen.Sidewinder.on |> Maze.Rend.png("sidewinder.png")
```

<img src="sidewinder.png" width="210">

### Aldous Broder

```
Maze.Grid.new(10,10) |> Maze.Gen.AldousBroder.on |> Maze.Rend.png("aldous_broder.png")
```

<img src="aldous_broder.png" width="210">

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `maze` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:maze, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/maze](https://hexdocs.pm/maze).
