defmodule GeoPattern.Patterns.NestedSquares do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  @num_pattern_units_in_row_or_col 6

  def generate(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col - 1),
        x <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end

  def make_pattern_unit({{x, y}, idx}, input_string) do
    val1 = input_string |> Utils.hex_int(idx, 1)
    val2 = input_string |> Utils.hex_int(39 - idx, 1)
    block_sz = block_size(input_string)
    square_sz = square_size(input_string)

    styles1 = [
      fill: "none",
      stroke: Utils.fill_color(val1),
      style: %{opacity: Utils.opacity(val1), stroke_width: block_sz}
    ]

    styles2 = [
      fill: "none",
      stroke: Utils.fill_color(val2),
      style: %{opacity: Utils.opacity(val2), stroke_width: block_sz}
    ]

    NodeCollection.new([
      Node.rect(
        (x * (square_sz + block_sz * 2)) + (block_sz / 2),
        (y * (square_sz + block_sz * 2)) + (block_sz / 2),
        square_sz,
        square_sz,
        styles1
      ),
      Node.rect(
        (x * (square_sz + block_sz * 2)) + (2 + 1/2) * block_sz,
        (y * (square_sz + block_sz * 2)) + (2 + 1/2) * block_sz,
        block_sz * 3,
        block_sz * 3,
        styles2
      )
    ])
  end

  def block_size(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(4, 12)
  end

  def square_size(input_string) do
    block_size(input_string) * 7
  end

  def width(input_string) do
    block_sz = block_size(input_string)
    square_sz = square_size(input_string)

    (6 * square_sz) + (12 * block_sz)
  end
  def height(input_string), do: width(input_string)
end
