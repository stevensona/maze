# Maze

Generate and render mazes with Elixir.
Based on material presented in [Mazes for Programmers](https://pragprog.com/book/jbmaze/mazes-for-programmers)
### Binary Tree

```
Maze.Grid.new(10,10) |> Maze.Gen.BinaryTree.on |> Maze.Rend.png("binarytree.png")
```

![](./binarytree.png | width=200)

### Sidewinder

```
Maze.Grid.new(10,10) |> Maze.Gen.Sidewinder.on |> Maze.Rend.png("sidewinder.png")
```

![](./sidewinder.png | width=200)

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
