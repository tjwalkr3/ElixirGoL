defmodule GameOfLife do
  def start(initial_live_cells) do
    Stream.iterate(initial_live_cells, &next_generation/1)
  end

  def createGlider do
    [{1, 0}, {2, 1}, {0, 2}, {1, 2}, {2, 2}]
  end

  defp next_generation(live_cells) do
    live_cells
    |> Enum.flat_map(&neighbors/1)
    |> Enum.frequencies()
    |> Enum.filter(fn {cell, count} -> survives?(cell, count, live_cells) end)
    |> Enum.map(&elem(&1, 0))
  end

  defp survives?(cell, count, live_cells) do
    (count == 3) or (count == 2 and cell in live_cells)
  end

  defp neighbors({x, y}) do
    for dx <- -1..1, dy <- -1..1, {dx, dy} != {0, 0}, do: {x + dx, y + dy}
  end


end

# Get the coordinates of live cells for each generation
GameOfLife.start(initial_live_cells) |> Enum.take(5)  # Adjust the number as needed
