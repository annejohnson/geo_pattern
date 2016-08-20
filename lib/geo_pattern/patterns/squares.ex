defmodule GeoPattern.Patterns.Squares do
  use GeoPattern.Patterns.Shared

  @min_pattern_unit_size 10
  @max_pattern_unit_size 60

  @num_pattern_units_in_row_or_col 6

  def pattern_nodes(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def width(input_string) do
    square_size(input_string) * @num_pattern_units_in_row_or_col
  end
  def height(input_string), do: width(input_string)

  def square_size(input_string) do
    hex_int = Utils.hex_int(input_string, 0)
    Utils.hex_remap(hex_int, @min_pattern_unit_size, @max_pattern_unit_size)
  end

  def make_pattern_unit({{x, y}, idx}, input_string) do
    hex_int = Utils.hex_int(input_string, idx)
    square_sz = square_size(input_string)

    Node.rect(
      y * square_sz,
      x * square_sz,
      square_sz,
      square_sz,
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

  def pattern_unit_points do
    for x <- 0..(@num_pattern_units_in_row_or_col - 1),
        y <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end
end
