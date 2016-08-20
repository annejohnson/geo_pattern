defmodule GeoPattern.Patterns.Triangles do
  use GeoPattern.Patterns.Shared

  require Integer

  @min_side_length 15
  @max_side_length 80

  @num_pattern_units_in_row_or_col 6

  def pattern_nodes(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit({{x, y}, i}, input_string) do
    hex_int = Utils.hex_int(input_string, i, 1)
    s_length = side_length(input_string)
    t_height = triangle_height(input_string)
    rotation =
      if Integer.is_even(y) == Integer.is_even(x) do
        180
      else
        0
      end

    styles = [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity
    ]

    nodes = [
      make_triangle(
        [
          s_length * (x - 1) / 2,
          t_height * y
        ],
        [
          rotation,
          s_length / 2,
          t_height / 2
        ],
        s_length,
        t_height,
        styles
      )
    ]

    if x == 0 do
      nodes = nodes ++ [
        make_triangle(
          [
            s_length / 2 * (@num_pattern_units_in_row_or_col - 1),
            t_height * y
          ],
          [
            rotation,
            s_length / 2,
            t_height / 2
          ],
          s_length,
          t_height,
          styles
        )
      ]
    end

    nodes
  end

  def make_triangle(translate_points,
                    rotate_points,
                    side_len,
                    triangle_height,
                    styles) do
    polyline_points_string =
      triangle_polyline_points(side_len, triangle_height)
      |> Enum.join(",")

    Node.polyline(
      polyline_points_string,
      Keyword.merge(styles, [
        transform: "translate(#{
          translate_points
          |> Enum.join(",")
        }) rotate(#{
          rotate_points
          |> Enum.join(",")
        })"
      ])
    )
  end

  def triangle_polyline_points(side_len, triangle_height) do
    half_len = side_len / 2
    [
      half_len,
      0,
      side_len,
      triangle_height,
      0,
      triangle_height,
      half_len,
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

  def triangle_height(input_string) do
    side_length(input_string) / 2 * :math.sqrt(3)
  end

  def width(input_string) do
    (@num_pattern_units_in_row_or_col / 2) * side_length(input_string)
  end

  def height(input_string) do
    triangle_height(input_string) * @num_pattern_units_in_row_or_col
  end
end
