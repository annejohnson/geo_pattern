defmodule GeoPattern.Patterns.Squares do
  alias GeoPattern.{SVG, Color, Utils}

  @num_squares_per_row_or_column 6

  def row_and_column_range do
    0..(@num_squares_per_row_or_column - 1)
  end

  def width(input_string) do
    square_size(input_string) * @num_squares_per_row_or_column
  end
  def height(input_string), do: width(input_string)

  def square_size(input_string) do
    min_width = 10
    max_width = 60
    hex_val = Utils.hex_val(input_string, 0)
    Utils.remap(hex_val, 0, 15, min_width, max_width)
  end

  def generate(input_string, options \\ []) do
    size = square_size(input_string)

    row_and_column_range
    |> Enum.map(fn(row_index) ->
         generate_row(input_string, row_index, size, options)
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
