defmodule GeoPattern.Patterns.Octagons do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.Node

  @min_octagon_size 10
  @max_octagon_size 60

  @num_octagons_per_row_or_col 6

  def generate(input_string) do
    octagon_points
    |> Stream.with_index
    |> Enum.map(&make_octagon(&1, input_string))
  end

  def make_octagon({{x, y}, i}, input_string) do
    octagon_size = octagon_size(input_string)

    styles = Keyword.merge(
      octagon_styles(input_string, i),
      [
        transform: "translate(#{
          [
            x * octagon_size,
            y * octagon_size
          ]
          |> Enum.join(",")
        })"
      ]
    )

    Node.polyline(
      octagon_size |> octagon_polyline_points |> Enum.join(","),
      styles
    )
  end

  def octagon_styles(input_string, octagon_index) do
    hex_int = input_string
              |> Utils.hex_int(octagon_index, 1)
    [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]
  end

  def octagon_polyline_points(octagon_size) do
    step_size = octagon_size * 0.33

    [
      step_size,
      0,
      octagon_size - step_size,
      0,
      octagon_size,
      step_size,
      octagon_size,
      octagon_size - step_size,
      octagon_size - step_size,
      octagon_size,
      step_size,
      octagon_size,
      0,
      octagon_size - step_size,
      0,
      step_size,
      step_size,
      0
    ]
    |> Enum.map(&Float.round(&1 * 1.0, 1))
  end

  def octagon_points do
    for y <- 0..(@num_octagons_per_row_or_col),
        x <- 0..(@num_octagons_per_row_or_col), do: {x, y}
  end

  def octagon_size(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.remap(0, 15, @min_octagon_size, @max_octagon_size)
  end

  def width(input_string) do
    octagon_size(input_string) * @num_octagons_per_row_or_col
  end
  def height(input_string), do: width(input_string)
end