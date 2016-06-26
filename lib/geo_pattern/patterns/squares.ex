defmodule GeoPattern.Patterns.Squares do
  alias GeoPattern.{SVG, Color, Utils}

  @num_squares_per_row_or_column 6

  def generate(input_string) do
    square_sz = square_size(input_string)

    row_and_column_range
    |> Enum.map(fn(row_index) ->
         generate_row(input_string, row_index, square_sz)
       end)
    |> List.flatten
  end

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

  def square_index(row_index, column_index) do
    (row_index * @num_squares_per_row_or_column) + column_index
  end

  def generate_row(input_string, row_index, square_size) do
    Enum.map(row_and_column_range, fn(column_index) ->
      hex_val = Utils.hex_val(
        input_string,
        square_index(row_index, column_index)
      )
      SVG.rect(
        column_index * square_size,
        row_index * square_size,
        square_size,
        square_size,
        rect_attrs(hex_val)
      )
    end)
  end

  def rect_attrs(hex_val) do
    [
      fill: Utils.fill_color(hex_val),
      fill_opacity: Utils.opacity(hex_val),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]
  end
end
