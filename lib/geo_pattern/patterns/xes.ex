defmodule GeoPattern.Patterns.Xes do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}
  require Integer

  @num_pattern_units_in_row_or_col 6

  def generate(input_string) do
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
    x_sz = x_size(input_string)
    square_sz = square_size(input_string)
    plus_nds = plus_nodes(square_sz)
    rotate_string =
      [
        45,
        x_sz / 2,
        x_sz / 2
      ]
      |> Enum.join(",")

    dy = if Integer.is_even(x) do
      x_sz * (y - 0.5)
    else
      x_sz * (y - 0.25)
    end

    dy2 = if Integer.is_even(x) do
      6 * x_sz - x_sz / 2
    else
      6 * x_sz - x_sz / 2 + x_sz / 4
    end

    styles = [
      fill: Utils.fill_color(hex_int),
      style: %{opacity: Utils.opacity(hex_int)}
    ]

    nodes = [
      NodeCollection.group(
        plus_nds,
        Keyword.merge(
          styles,
          transform: "translate(#{
            [
              (x_sz / 2) * (x - 1),
              dy - y * x_sz / 2
            ]
            |> Enum.join(",")
          }) rotate(#{rotate_string})"
        )
      )
    ]

    if x == 0 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(
            styles,
            transform: "translate(#{
              [
                6 * x_sz / 2 - x_sz / 2,
                dy - y * x_sz / 2
              ]
              |> Enum.join(",")
            }) rotate(#{rotate_string})"
          )
        )
      ]
    end

    if y == 0 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(
            styles,
            transform: "translate(#{
              [
                x * x_sz / 2 - x_sz / 2,
                dy2 - 6 * x_sz / 2
              ]
              |> Enum.join(",")
            }) rotate(#{rotate_string})"
          )
        )
      ]
    end

    if y == 5 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(
            styles,
            transform: "translate(#{
              [
                x * x_sz / 2 - x_sz / 2,
                dy2 - 11 * x_sz / 2
              ]
              |> Enum.join(",")
            }) rotate(#{rotate_string})"
          )
        )
      ]
    end

    if x == 0 && y == 0 do
      nodes = nodes ++ [
        NodeCollection.group(
          plus_nds,
          Keyword.merge(
            styles,
            transform: "translate(#{
              [
                6 * x_sz / 2 - x_sz / 2,
                dy2 - 6 * x_sz / 2
              ]
              |> Enum.join(",")
            }) rotate(#{rotate_string})"
          )
        )
      ]
    end

    NodeCollection.new(nodes)
  end

  def square_size(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(10, 25)
  end

  def x_size(input_string) do
    square_size(input_string) * 3 * 0.943
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

  def width(input_string) do
    x_size(input_string) * 3
  end
  def height(input_string), do: width(input_string)
end
