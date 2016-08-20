defmodule GeoPattern.Patterns.Tessellation do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  @min_side_length 5
  @max_side_length 40

  def generate(input_string) do
    0..19
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit(i, input_string) do
    hex_int = Utils.hex_int(input_string, i, 1)

    s_len = side_length(input_string)
    tl_width = tile_width(input_string)
    tl_height = tile_height(input_string)
    tr_height = triangle_height(input_string)
    h_width = hex_width(input_string)
    h_height = hex_height(input_string)

    styles = [
      fill: Utils.fill_color(hex_int),
      fill_opacity: Utils.opacity(hex_int),
      stroke: Utils.stroke_color,
      stroke_opacity: Utils.stroke_opacity,
      stroke_width: 1
    ]

    case i do
      0 ->
        [
          Node.rect(
            -s_len / 2,
            -s_len / 2,
            s_len,
            s_len,
            styles
          ),
          Node.rect(
            tl_width - s_len / 2,
            -s_len / 2,
            s_len,
            s_len,
            styles
          ),
          Node.rect(
            -s_len / 2,
            tl_height - s_len / 2,
            s_len,
            s_len,
            styles
          ),
          Node.rect(
            tl_width - s_len / 2,
            tl_height - s_len / 2,
            s_len,
            s_len,
            styles
          )
        ]
      1 ->
        Node.rect(
          h_width / 2 + tr_height,
          h_height / 2,
          s_len,
          s_len,
          styles
        )
      2 ->
        [
          Node.rect(
            -s_len / 2,
            tl_height / 2 - s_len / 2,
            s_len,
            s_len,
            styles
          ),
          Node.rect(
            tl_width - s_len / 2,
            tl_height / 2 - s_len / 2,
            s_len,
            s_len,
            styles
          )
        ]
      3 ->
        Node.rect(
          h_width / 2 + tr_height,
          h_height * 1.5 + s_len,
          s_len,
          s_len,
          styles
        )
      4 ->
        [
          make_triangle(
            s_len,
            tr_height,
            styles,
            [
              s_len / 2,
              -s_len / 2
            ],
            [
              0,
              s_len / 2,
              tr_height / 2
            ],
            []
          ),
          make_triangle(
            s_len,
            tr_height,
            styles,
            [
              s_len / 2,
              tl_height + s_len / 2,
            ],
            [
              0,
              s_len / 2,
              tr_height / 2
            ],
            [
              1,
              -1
            ]
          )
        ]
      5 ->
        [
          make_triangle(
            s_len,
            tr_height,
            styles,
            [
              tl_width - s_len / 2,
              -s_len / 2
            ],
            [
              0,
              s_len / 2,
              tr_height / 2
            ],
            [
              -1,
              1
            ]
          ),
          make_triangle(
            s_len,
            tr_height,
            styles,
            [
              tl_width - s_len / 2,
              tl_height + s_len / 2,
            ],
            [
              0,
              s_len / 2,
              tr_height / 2
            ],
            [
              -1,
              -1
            ]
          )
        ]
      6 ->
        make_triangle(
          s_len,
          tr_height,
          styles,
          [
            tl_width / 2 + s_len / 2,
            h_height / 2
          ],
          [],
          []
        )
      7 ->
        make_triangle(
          s_len,
          tr_height,
          styles,
          [
            tl_width / 2 - s_len / 2,
            h_height / 2
          ],
          [],
          [
            -1,
            1
          ]
        )
      8 ->
        make_triangle(
          s_len,
          tr_height,
          styles,
          [
            tl_width / 2 + s_len / 2,
            tl_height - h_height / 2
          ],
          [],
          [
            1,
            -1
          ]
        )
      9 ->
        make_triangle(
          s_len,
          tr_height,
          styles,
          [
            tl_width / 2 - s_len / 2,
            tl_height - h_height / 2
          ],
          [],
          [
            -1,
            -1
          ]
        )
      10 ->
        make_triangle(
          s_len,
          tr_height,
          styles,
          [
            s_len / 2,
            tl_height / 2 - s_len / 2
          ],
          [],
          []
        )
      11 ->
        make_triangle(
          s_len,
          tr_height,
          styles,
          [
            tl_width - s_len / 2,
            tl_height / 2 - s_len / 2
          ],
          [],
          [
            -1,
            1
          ]
        )
      12 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "translate(#{
              [
                s_len / 2,
                s_len / 2
              ]
              |> Enum.join(",")
            }) rotate(-30, 0, 0)"
          ])
        )
      13 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "translate(#{
              [
                s_len / 2 - tl_width,
                s_len / 2
              ]
              |> Enum.join(",")
            }) rotate(-30, 0, 0)"
          ])
        )
      14 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "translate(#{
              [
                s_len / 2,
                tl_height / 2 - s_len / 2 - s_len
              ]
              |> Enum.join(",")
            }) rotate(30, 0, #{s_len})"
          ])
        )
      15 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "scale(-1, 1) translate(#{
              [
                s_len / 2 - tl_width,
                tl_height / 2 - s_len / 2 - s_len
              ]
              |> Enum.join(",")
            }) rotate(30, 0, #{s_len})"
          ])
        )
      16 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "scale(1, -1) translate(#{
              [
                s_len / 2,
                tl_height / 2  - tl_height - s_len / 2 - s_len
              ]
              |> Enum.join(",")
            }) rotate(30, 0, #{s_len})"
          ])
        )
      17 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "scale(-1, -1) translate(#{
              [
                s_len / 2 - tl_width,
                tl_height / 2  - tl_height - s_len / 2 - s_len
              ]
              |> Enum.join(",")
            }) rotate(30, 0, #{s_len})"
          ])
        )
      18 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "scale(1, -1) translate(#{
              [
                s_len / 2,
                s_len / 2 - tl_height
              ]
              |> Enum.join(",")
            }) rotate(-30, 0, 0)"
          ])
        )
      19 ->
        Node.rect(
          0,
          0,
          s_len,
          s_len,
          Keyword.merge(styles, [
            transform: "scale(-1, -1) translate(#{
              [
                s_len / 2 - tl_width,
                s_len / 2 - tl_height
              ]
              |> Enum.join(",")
            }) rotate(-30, 0, 0)"
          ])
        )
    end
  end

  def make_triangle(side_len, width, styles, translate_points, rotate_points, scale_points) do
    polyline_points_string =
      triangle_polyline_points(side_len, width)
      |> Enum.join(",")

    translate_string =
      "translate(#{Enum.join(translate_points, ",")})#{
        if length(rotate_points) > 0 do
          " rotate(#{Enum.join(rotate_points, ",")})"
        end
      }#{
        if length(scale_points) > 0 do
          " scale(#{Enum.join(scale_points, ",")})"
        end
      }"

    Node.polyline(
      polyline_points_string,
      Keyword.merge(styles, [
        transform: translate_string
      ])
    )
  end

  def triangle_polyline_points(side_len, width) do
    [
      0,
      0,
      width,
      side_len / 2,
      0,
      side_len,
      0,
      0
    ]
  end

  def triangle_height(input_string) do
    side_length(input_string) / 2 * :math.sqrt(3)
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
    side_length(input_string) * 3 + triangle_height(input_string) * 2
  end
  def tile_width(input_string), do: width(input_string)

  def height(input_string) do
    hex_height(input_string) * 2 + side_length(input_string) * 2
  end
  def tile_height(input_string), do: height(input_string)
end
