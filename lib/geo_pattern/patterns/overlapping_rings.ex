defmodule GeoPattern.Patterns.OverlappingRings do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  @min_pattern_unit_size 10
  @max_pattern_unit_size 60

  @num_pattern_units_in_row_or_col 6

  def generate(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit({{x, y}, idx}, input_string) do
    hex_int = Utils.hex_int(input_string, idx, 1)
    ring_sz = ring_size(input_string)
    stroke_wd = stroke_width(input_string)

    styles = [
      fill: 'none',
      stroke: Utils.fill_color(hex_int),
      style: %{opacity: Utils.opacity(hex_int), stroke_width: "#{stroke_wd}px"}
    ]

    nodes = [
      Node.circle(
        x * ring_sz,
        y * ring_sz,
        ring_sz - stroke_wd / 2,
        styles
      )
    ]

    if x == 0 do
      nodes = nodes ++ [
        Node.circle(
          6 * ring_sz,
          y * ring_sz,
          ring_sz - stroke_wd / 2,
          styles
        )
      ]
    end

    if y == 0 do
      nodes = nodes ++ [
        Node.circle(
          x * ring_sz,
          6 * ring_sz,
          ring_sz - stroke_wd / 2,
          styles
        )
      ]
    end

    if x == 0 && y == 0 do
      nodes = nodes ++ [
        Node.circle(
          6 * ring_sz,
          6 * ring_sz,
          ring_sz - stroke_wd / 2,
          styles
        )
      ]
    end

    NodeCollection.new(nodes)
  end

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col - 1),
        x <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end

  def ring_size(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(@min_pattern_unit_size, @max_pattern_unit_size)
  end

  def stroke_width(input_string) do
    ring_size(input_string) / 4
  end

  def width(input_string) do
    ring_size(input_string) * 6
  end
  def height(input_string), do: width(input_string)
end
