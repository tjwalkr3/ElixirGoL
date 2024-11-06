defmodule Geometry do
  defmodule Rectangle do
    def rectangle_area(a, b) do
      a * b
    end

    def print_5 do
        -5
        |> abs()
        |> Integer.to_string()
        |> IO.puts()
    end
  end

  defmodule Circle do
    @pi 3.14159 # This is how attributes are set

    def area(r), do: r*r*@pi
    def circumference(r), do: 2*r*@pi
  end
end

a = {4, 5, 6}
a = {a, a}
b = {2, 3}

b
|> elem(1)
|> IO.puts()

cell = {:cell, 5, 10}

cell2 = %{:row => 5, :column => 10}
%{:row => row} = %{:row => 5, :column => 10}

# Use this function by running
# iex geometry.ex
# Geometry.Rectangle.rectangle_area(6, 7)
# Geometry.Rectangle.print_5
# in the terminal

# if a function has no parameters, you can omit the parentheses
# use "mix format geometry.ex" to format your code
# /2 after a function name indicates that a function is going to
# <> is the concatenation operator
