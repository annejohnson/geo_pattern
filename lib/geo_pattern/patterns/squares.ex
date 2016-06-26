defmodule GeoPattern.Patterns.Squares do
  alias GeoPattern.{SVG, Color}

  @num_squares_in_row 6

  def row_and_column_range do
    0..(@num_squares_in_row - 1)
  end

  def square_width(total_width) do
    round(total_width / @num_squares_in_row)
  end

  def generate(input, options \\ []) do
    row_and_column_range
    |> Enum.map(fn(row_index) ->
         generate_row(row_index, options)
       end)
    |> List.flatten
  end

  def generate_row(row_index, options \\ []) do
    square_width = square_width(Keyword.get(options, :width, 101))

    Enum.map(row_and_column_range, fn(column_index) ->
      SVG.rect(
        column_index * square_width,
        row_index * square_width,
        square_width,
        square_width,
        fill: Color.to_svg("#33ff99"),
        fill_opacity: 1.0,
        stroke: Color.to_svg("#778899"),
        stroke_opacity: 1.0
      )
    end)
  end
end
