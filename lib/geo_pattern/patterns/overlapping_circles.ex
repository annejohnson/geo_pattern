defmodule GeoPattern.Patterns.OverlappingCircles do
  use GeoPattern.Patterns.Shared

  @num_pattern_units_in_row_or_col 6

  def pattern_nodes(input_string) do
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
    hex_int = Utils.hex_int(input_string, idx, 1)
    styles = [
      fill: Utils.fill_color(hex_int),
      style: %{opacity: Utils.opacity(hex_int)}
    ]
    unit_radius = radius(input_string)

    nodes = [
      Node.circle(
        x * unit_radius,
        y * unit_radius,
        unit_radius,
        styles
      )
    ]

    if x == 0 do
      nodes = nodes ++ [
        Node.circle(
          6 * unit_radius,
          y * unit_radius,
          unit_radius,
          styles
        )
      ]
    end

    if y == 0 do
      nodes = nodes ++ [
        Node.circle(
          x * unit_radius,
          6 * unit_radius,
          unit_radius,
          styles
        )
      ]
    end

    if x == 0 && y == 0 do
      nodes = nodes ++ [
        Node.circle(
          6 * unit_radius,
          6 * unit_radius,
          unit_radius,
          styles
        )
      ]
    end

    NodeCollection.new(nodes)
  end

  def diameter(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(25, 200)
  end

  def radius(input_string) do
    diameter(input_string) / 2
  end

  def width(input_string) do
    diameter(input_string) * 3
  end
  def height(input_string), do: width(input_string)
end
