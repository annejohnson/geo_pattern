defmodule GeoPattern.Patterns.Squares do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  @num_squares_per_row_or_column 6

  def generate(input_string) do
    square_sz = square_size(input_string)

    row_and_column_range
    |> Enum.map(fn(row_index) ->
         generate_row(input_string, row_index, square_sz)
       end)
    |> List.flatten
    |> NodeCollection.new
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
    hex_int = Utils.hex_int(input_string, 0)
    Utils.hex_remap(hex_int, min_width, max_width)
  end

  def square_index(row_index, column_index) do
    (row_index * @num_squares_per_row_or_column) + column_index
  end

  def generate_row(input_string, row_index, square_size) do
    Enum.map(
      row_and_column_range,
      fn(column_index) ->
        generate_rectangle(input_string, row_index, column_index, square_size)
      end
    )
  end

  def generate_rectangle(input_string, row_index, column_index, square_size) do
    hex_int = Utils.hex_int(
      input_string,
      square_index(row_index, column_index)
    )
    Node.rect(
      column_index * square_size,
      row_index * square_size,
      square_size,
      square_size,
      rect_attrs(hex_int)
    )
  end

  def rect_attrs(hex_int) do
    [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]
  end
end
