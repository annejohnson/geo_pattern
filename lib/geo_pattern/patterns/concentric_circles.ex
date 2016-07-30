defmodule GeoPattern.Patterns.ConcentricCircles do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  @min_circ_size 10
  @max_circ_size 60
  @num_pattern_units_in_row_or_col 5

  def generate(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
  end

  def make_pattern_unit({{x, y}, idx}, input_string) do
    val1 = Utils.hex_int(input_string, idx, 1)
    val2 = Utils.hex_int(input_string, 39 - idx, 1)
    ring_sz = ring_size(input_string)
    stroke_wd = stroke_width(input_string)

    circle1_styles = [
      fill: 'none',
      stroke: Utils.fill_color(val1),
      style: %{opacity: Utils.opacity(val1), stroke_width: "#{stroke_wd}px"}
    ]

    circle2_styles = [
      fill: Utils.fill_color(val2),
      fill_opacity: Utils.opacity(val2)
    ]

    cx = (x + 1/2) * (ring_sz + stroke_wd)
    cy = (y + 1/2) * (ring_sz + stroke_wd)

    NodeCollection.new([
      Node.circle(
        cx,
        cy,
        ring_sz / 2,
        circle1_styles
      ),
      Node.circle(
        cx,
        cy,
        ring_sz / 4,
        circle2_styles
      )
    ])
  end

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col),
        x <- 0..(@num_pattern_units_in_row_or_col), do: {x, y}
  end

  def ring_size(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(@min_circ_size, @max_circ_size)
  end

  def stroke_width(input_string) do
    ring_size(input_string) / 5
  end

  def width(input_string) do
    (ring_size(input_string) + stroke_width(input_string)) * 6
  end
  def height(input_string), do: width(input_string)
end
