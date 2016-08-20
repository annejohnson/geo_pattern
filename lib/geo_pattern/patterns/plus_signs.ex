defmodule GeoPattern.Patterns.PlusSigns do
  use GeoPattern.Patterns.Shared

  require Integer

  @num_pattern_units_in_row_or_col 6

  def pattern_nodes(input_string) do
    pattern_unit_points
    |> Stream.with_index
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def plus_nodes(square_sz) do
    [
      Node.rect(
        square_sz,
        0,
        square_sz,
        square_sz * 3
      ),
      Node.rect(
        0,
        square_sz,
        square_sz * 3,
        square_sz
      )
    ]
  end

  def make_pattern_unit({{x, y}, idx}, input_string) do
    hex_int = Utils.hex_int(input_string, idx, 1)
    dx = if Integer.is_even(y), do: 0, else: 1
    p_size = plus_size(input_string)
    s_size = square_size(input_string)
    plus_nds = plus_nodes(s_size)

    styles = [
      fill: Utils.fill_color(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity,
      style: %{fill_opacity: Utils.opacity(hex_int)}
    ]

    nodes = [
      NodeCollection.group(
        plus_nds,
        Keyword.merge(styles, [
          transform: "translate(#{
            [
              x * p_size - x * s_size + dx * s_size - s_size,
              y * p_size - y * s_size - p_size / 2
            ]
            |> Enum.join(",")
          })"
        ])
      )
    ]

    if x == 0 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(styles, [
            transform: "translate(#{
              [
                4 * p_size - x * s_size + dx * s_size - s_size,
                y * p_size - y * s_size - p_size / 2
              ] |> Enum.join(",")
            })"
          ])
        )
      ]
    end

    if y == 0 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(styles, [
            transform: "translate(#{
              [
                x * p_size - x * s_size + dx * s_size - s_size,
                4 * p_size - y * s_size - p_size / 2
              ] |> Enum.join(",")
            })"
          ])
        )
      ]
    end

    if x == 0 && y == 0 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(styles, [
            transform: "translate(#{
              [
                4 * p_size - x * s_size + dx * s_size - s_size,
                4 * p_size - y * s_size - p_size / 2
              ] |> Enum.join(",")
            })"
          ])
        )
      ]
    end

    NodeCollection.new(nodes)
  end

  def pattern_unit_points do
    for y <- 0..(@num_pattern_units_in_row_or_col - 1),
        x <- 0..(@num_pattern_units_in_row_or_col - 1), do: {x, y}
  end

  def square_size(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(10, 25)
  end

  def plus_size(input_string) do
    square_size(input_string) * 3
  end

  def width(input_string) do
    square_size(input_string) * 12
  end
  def height(input_string), do: width(input_string)
end
