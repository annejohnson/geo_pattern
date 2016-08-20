defmodule GeoPattern.Patterns.Diamonds do
  use GeoPattern.Patterns.Shared

  require Integer

  @min_diamond_length 10
  @max_diamond_length 50

  @num_pattern_units_in_row_or_col 6

  def pattern_nodes(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit({{x, y}, i}, input_string) do
    hex_int = Utils.hex_int(input_string, i, 1)
    d_width = diamond_width(input_string)
    d_height = diamond_height(input_string)
    dx =
      if Integer.is_even(y) do
        0
      else
        d_width / 2
      end

    styles = [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]

    nodes = [
      make_diamond([
        x * d_width - d_width / 2 + dx,
        d_height / 2 * (y - 1)
      ], d_width, d_height, styles)
    ]

    if x == 0 do
      nodes = nodes ++ [
        make_diamond([
          @num_pattern_units_in_row_or_col * d_width - d_width / 2 + dx,
          d_height / 2 * (y - 1)
        ], d_width, d_height, styles)
      ]
    end

    if y == 0 do
      nodes = nodes ++ [
        make_diamond([
          x * d_width - d_width / 2 + dx,
          d_height * @num_pattern_units_in_row_or_col / 2 - d_height / 2
        ], d_width, d_height, styles)
      ]
    end

    if x == 0 && y == 0 do
      nodes = nodes ++ [
        make_diamond([
          @num_pattern_units_in_row_or_col * d_width - d_width / 2 + dx,
          d_height * @num_pattern_units_in_row_or_col / 2 - d_height / 2
        ], d_width, d_height, styles)
      ]
    end

    nodes
  end

  def make_diamond(translate_points, diamond_width, diamond_height, styles) do
    polyline_points_string =
      diamond_polyline_points(diamond_width, diamond_height)
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

  def diamond_polyline_points(width, height) do
    [
      width / 2,
      0,
      width,
      height / 2,
      width / 2,
      height,
      0,
      height / 2
    ]
  end

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col - 1),
        x <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end

  def diamond_width(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(@min_diamond_length, @max_diamond_length)
  end

  def diamond_height(input_string) do
    input_string
    |> Utils.hex_int(1, 1)
    |> Utils.hex_remap(@min_diamond_length, @max_diamond_length)
  end

  def width(input_string) do
    diamond_width(input_string) * @num_pattern_units_in_row_or_col
  end

  def height(input_string) do
    diamond_height(input_string) * (@num_pattern_units_in_row_or_col / 2)
  end
end
