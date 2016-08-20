defmodule GeoPattern.Patterns.Chevrons do
  use GeoPattern.Patterns.Shared

  @min_pattern_unit_size 30
  @max_pattern_unit_size 80

  @num_pattern_units_in_row_or_col 6

  def pattern_nodes(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit({{x, y}, i}, input_string) do
    chevron_width = chevron_width(input_string)
    chevron_height = chevron_height(input_string)
    chevron_nodes = chevron_nodes(chevron_width, chevron_height)
    styles = chevron_group_styles(input_string, i)

    nodes = make_chevron_group(
      chevron_translate_x(x, chevron_width),
      chevron_translate_y(y, chevron_height),
      chevron_nodes,
      styles
    )

    if y == 0 do
      nodes ++
        make_chevron_group(
          chevron_translate_x(x, chevron_width),
          chevron_translate_y(@num_pattern_units_in_row_or_col, chevron_height),
          chevron_nodes,
          styles
        )
    else
      nodes
    end
  end

  def make_chevron_group(translate_x, translate_y, chevron_nodes, group_styles) do
    NodeCollection.group(
      chevron_nodes,
      Keyword.merge(group_styles, [
        transform: "translate(#{
          [
            translate_x,
            translate_y
          ] |> Enum.join(",")
        })"
      ])
    ).nodes
  end

  def chevron_translate_y(y_index, chevron_height) do
    (y_index * chevron_height * 0.66) - (chevron_height / 2)
  end

  def chevron_translate_x(x_index, chevron_width) do
    x_index * chevron_width
  end

  def chevron_group_styles(input_string, group_index) do
    hex_int = input_string |> Utils.hex_int(group_index, 1)

    [
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity,
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke_width: 1
    ]
  end

  def width(input_string) do
    chevron_width(input_string) * @num_pattern_units_in_row_or_col
  end

  def height(input_string) do
    chevron_height(input_string) * @num_pattern_units_in_row_or_col * 0.66
  end

  def chevron_width(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(@min_pattern_unit_size, @max_pattern_unit_size)
  end
  def chevron_height(input_string), do: chevron_width(input_string)

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col - 1),
        x <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end

  def chevron_nodes(chevron_width, chevron_height) do
    [
      left_chevron_points(chevron_width, chevron_height),
      right_chevron_points(chevron_width, chevron_height)
    ]
    |> Enum.map(fn(points) ->
         points |> Enum.join(",") |> Node.polyline
       end)
  end

  def left_chevron_points(chevron_width, chevron_height) do
    e = chevron_height * 0.66

    [
      0,
      0,
      chevron_width / 2,
      chevron_height - e,
      chevron_width / 2,
      chevron_height,
      0,
      e,
      0,
      0
    ]
  end

  def right_chevron_points(chevron_width, chevron_height) do
    e = chevron_height * 0.66

    [
      chevron_width / 2,
      chevron_height - e,
      chevron_width,
      0,
      chevron_width,
      e,
      chevron_width / 2,
      chevron_height,
      chevron_width / 2,
      chevron_height - e
    ]
  end
end
