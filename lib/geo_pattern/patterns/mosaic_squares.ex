defmodule GeoPattern.Patterns.MosaicSquares do
  use GeoPattern.Patterns.Shared

  require Integer

  @min_side_length 15
  @max_side_length 50

  @num_pattern_units_in_row_or_col 4

  def pattern_nodes(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit({{x, y}, i}, input_string) do
    hex_int = Utils.hex_int(input_string, i, 1)
    next_hex_int = Utils.hex_int(input_string, i + 1, 1)
    t_size = side_length(input_string)

    if Integer.is_even(x) == Integer.is_even(y) do
      outer_mosaic_tile(
        x * t_size * 2,
        y * t_size * 2,
        t_size,
        hex_int
      )
    else
      inner_mosaic_tile(
        x * t_size * 2,
        y * t_size * 2,
        t_size,
        [hex_int, next_hex_int]
      )
    end
  end

  def inner_mosaic_tile(x, y, side_len, [hex_int, next_hex_int]) do
    styles1 = [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]
    styles2 = [
      fill: Utils.fill_color(next_hex_int),
      fill_opacity: Utils.opacity(next_hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]

    [
      make_triangle(
        [
          x + side_len,
          y
        ],
        [
          -1,
          1
        ],
        side_len,
        styles1
      ),
      make_triangle(
        [
          x + side_len,
          y + side_len * 2
        ],
        [
          1,
          -1
        ],
        side_len,
        styles1
      ),
      make_triangle(
        [
          x + side_len,
          y + side_len * 2
        ],
        [
          -1,
          -1
        ],
        side_len,
        styles2
      ),
      make_triangle(
        [
          x + side_len,
          y
        ],
        [
          1,
          1
        ],
        side_len,
        styles2
      )
    ]
  end

  def outer_mosaic_tile(x, y, side_len, hex_int) do
    styles = [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]

    [
      make_triangle(
        [
          x,
          y + side_len
        ],
        [
          1,
          -1
        ],
        side_len,
        styles
      ),
      make_triangle(
        [
          x + side_len * 2,
          y + side_len
        ],
        [
          -1,
          -1
        ],
        side_len,
        styles
      ),
      make_triangle(
        [
          x,
          y + side_len
        ],
        [
          1,
          1
        ],
        side_len,
        styles
      ),
      make_triangle(
        [
          x + side_len * 2,
          y + side_len
        ],
        [
          -1,
          1
        ],
        side_len,
        styles
      ),
    ]
  end

  def make_triangle(translate_points,
                    scale_points,
                    side_len,
                    styles) do
    polyline_points_string =
      triangle_polyline_points(side_len)
      |> Enum.join(",")

    Node.polyline(
      polyline_points_string,
      Keyword.merge(styles, [
        transform: "translate(#{
          translate_points
          |> Enum.join(",")
        }) scale(#{
          scale_points
          |> Enum.join(",")
        })"
      ])
    )
  end

  def triangle_polyline_points(side_len) do
    [
      0,
      0,
      side_len,
      side_len,
      0,
      side_len,
      0,
      0
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

  def width(input_string) do
    side_length(input_string) * 8
  end
  def height(input_string), do: width(input_string)
end
