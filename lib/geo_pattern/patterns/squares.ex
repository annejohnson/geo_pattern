defmodule GeoPattern.Patterns.Squares do
  alias GeoPattern.{SVG, Color, Utils}

  @num_squares_in_row 6

  def row_and_column_range do
    0..(@num_squares_in_row - 1)
  end

  def square_width(input_string) do
    min_width = 10
    max_width = 60
    hex_val = Utils.hex_val(input_string, 0)
    Utils.remap(hex_val, 0, 15, min_width, max_width)
  end

  def generate(input_string, options \\ []) do
    square_size = square_width(input_string)

    row_and_column_range
    |> Enum.map(fn(row_index) ->
         generate_row(input_string, row_index, square_size, options)
       end)
    |> List.flatten
  end

  def generate_row(input_string, row_index, square_size, options \\ []) do
    Enum.map(row_and_column_range, fn(column_index) ->
      SVG.rect(
        column_index * square_size,
        row_index * square_size,
        square_size,
        square_size,
        fill: Color.to_svg("#33ff99"),
        fill_opacity: 1.0,
        stroke: Color.to_svg("#778899"),
        stroke_opacity: 1.0
      )
    end)
  end
end
