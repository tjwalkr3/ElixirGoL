defmodule GameOfLife do
  def start(initial_live_cells) do
    Stream.iterate(initial_live_cells, &next_generation/1) # Create a stream to get the next generation lazily
  end

  def create_glider do
    [{1, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}]
  end

  def next_generation(live_cells) do
    live_cells
    |> Enum.flat_map(&neighbors/1)  # gets all neighbors for all cells, including duplicates
    |> Enum.frequencies()           # the frequency is the number of live neighbors a cell has
    |> Enum.filter(fn {cell, count} -> live?(cell, count, live_cells) end) # apply the game of life rules
    |> Enum.map(&elem(&1, 0))       # extract the coordinates themselves (without the mapped count)
  end

  def live?(cell, count, live_cells) do
    (count == 3) or (count == 2 and cell in live_cells)
  end

  def neighbors({x, y}) do
    for dx <- -1..1, dy <- -1..1, {dx, dy} != {0, 0}, do: {x + dx, y + dy} # iterate through offsets, excluding (0,0)
  end

  def run_game(iterations) do
    initial_live_cells = create_glider()
    generations = start(initial_live_cells) |> Enum.take(iterations)
    IO.puts("First Generation: #{inspect(List.first(generations))}")
    IO.puts("Last Generation: #{inspect(List.last(generations))}")
  end
end

GameOfLife.run_game(100)

# Get the coordinates of live cells for each generation
# To run the game, type:
# iex game_of_life.ex
