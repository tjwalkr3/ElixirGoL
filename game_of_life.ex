defmodule GameOfLife do
  # Starts the game with an initial set of live cells and generates the next generation indefinitely
  def start(initial_live_cells) do
    Stream.iterate(initial_live_cells, &next_generation/1)
  end

  # Generates the next generation by processing each live cell and their neighbors
  defp next_generation(live_cells) do
    live_cells
    |> Enum.flat_map(&neighbors/1)
    |> Enum.frequencies()
    |> Enum.filter(fn {cell, count} -> survives?(cell, count, live_cells) end)
    |> Enum.map(&elem(&1, 0))
  end

  # Checks if a cell should survive or be born in the next generation
  defp survives?(cell, count, live_cells) do
    (count == 3) or (count == 2 and cell in live_cells)
  end

  # Gets all 8 neighboring cells for a given cell
  defp neighbors({x, y}) do
    for dx <- -1..1, dy <- -1..1, {dx, dy} != {0, 0}, do: {x + dx, y + dy}
  end
end