defmodule GeoPattern.Patterns.Hexagons do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}
  require Integer

  @min_side_length 8
  @max_side_length 60

  @num_pattern_units_in_row_or_col 6

  def generate(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit({{x, y}, i}, input_string) do
    hex_int = Utils.hex_int(input_string, i, 1)
    s_length = side_length(input_string)
    h_width = hex_width(input_string)
    h_height = hex_height(input_string)
    dy =
      if Integer.is_even(x) do
        y * h_height
      else
        y * h_height + h_height / 2
      end

    styles = [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]

    nodes = [
      make_hexagon([
        x * s_length * 1.5 - h_width / 2,
        dy - h_height / 2
      ], s_length, styles)
    ]

    if x == 0 do
      nodes = nodes ++ [
        make_hexagon([
          @num_pattern_units_in_row_or_col * s_length * 1.5 - h_width / 2,
          dy - h_height / 2
        ], s_length, styles)
      ]
    end

    if y == 0 do
      dy2 = if Integer.is_even(x) do
        @num_pattern_units_in_row_or_col * h_height
      else
        @num_pattern_units_in_row_or_col * h_height + h_height / 2
      end

      nodes = nodes ++ [
        make_hexagon([
          x * s_length * 1.5 - h_width / 2,
          dy2 - h_height / 2
        ], s_length, styles)
      ]
    end

    if x == 0 && y == 0 do
      nodes = nodes ++ [
        make_hexagon([
          @num_pattern_units_in_row_or_col * s_length * 1.5 - h_width / 2,
          (@num_pattern_units_in_row_or_col - 1) * h_height + h_height / 2
        ], s_length, styles)
      ]
    end

    nodes
  end

  def make_hexagon(translate_points, side_len, styles) do
    polyline_points_string =
      side_len
      |> hexagon_polyline_points
      |> Enum.join(",")

    Node.polyline(
      polyline_points_string,
      Keyword.merge(styles, [
        transform: "translate(#{
          translate_points
          |> Enum.join(",")
        })"
      ])
    )
  end

  def hexagon_polyline_points(side_len) do
    a = side_len / 2
    b = :math.sin(60 * :math.pi / 180) * side_len

    [
      0,
      b,
      a,
      0,
      a + side_len,
      0,
      2 * side_len,
      b,
      a + side_len,
      2 * b,
      a,
      2 * b,
      0,
      b
    ]
  end

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col - 1),
        x <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end

  def side_length(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(@min_side_length, @max_side_length)
  end

  def hex_width(input_string) do
    side_length(input_string) * 2
  end

  def hex_height(input_string) do
    side_length(input_string) * :math.sqrt(3)
  end

  def width(input_string) do
    3 * hex_width(input_string) + 3 * side_length(input_string)
  end

  def height(input_string) do
    hex_height(input_string) * @num_pattern_units_in_row_or_col
  end
end
