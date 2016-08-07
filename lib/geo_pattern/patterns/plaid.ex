defmodule GeoPattern.Patterns.Plaid do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}
  require Integer

  @num_pattern_units_in_row_or_col 17

  def generate(input_string) do
    NodeCollection.new([
      horizontal_stripe_nodes(input_string),
      vertical_stripe_nodes(input_string)
    ])
  end

  def horizontal_stripe_nodes(input_string) do
    input_string
    |> stripe_data
    |> Enum.map(&stripe_data_to_horizontal_stripe_node/1)
  end

  def vertical_stripe_nodes(input_string) do
    input_string
    |> stripe_data
    |> Enum.map(&stripe_data_to_vertical_stripe_node/1)
  end

  def stripe_data_to_horizontal_stripe_node(%{position: y,
                                              hex_int: hex_int,
                                              stripe_size: stripe_height}) do
    Node.rect(
      0,
      y,
      "100%",
      stripe_height,
      opacity: Utils.opacity(hex_int),
      fill: Utils.fill_color(hex_int)
    )
  end

  def stripe_data_to_vertical_stripe_node(%{position: x,
                                            hex_int: hex_int,
                                            stripe_size: stripe_width}) do
    Node.rect(
      x,
      0,
      stripe_width,
      "100%",
      opacity: Utils.opacity(hex_int),
      fill: Utils.fill_color(hex_int)
    )
  end

  def stripe_data(input_string) do
    input_string
    |> stripe_and_space_sizes
    |> Enum.reduce(
         [],
         fn(%{stripe_size: stripe_size, space_size: space_size} = datum,
            stripe_data) ->

           prev_datum = List.last(stripe_data)
           prev_length = if prev_datum, do: prev_datum[:total_length], else: 0

           position = prev_length + space_size + 5
           new_length = position + stripe_size

           datum = Map.merge(datum, %{
             position: position,
             total_length: new_length
           })

           stripe_data ++ [datum]
         end
       )
  end

  def stripe_and_space_sizes(input_string) do
    for i <- 0..(@num_pattern_units_in_row_or_col * 2), Integer.is_even(i) do
      space_size = Utils.hex_int(input_string, i, 1)
      hex_int = Utils.hex_int(input_string, i + 1, 1)
      stripe_size = hex_int + 5

      %{
        hex_int: hex_int,
        stripe_size: stripe_size,
        space_size: space_size
      }
    end
  end

  def width(input_string) do
    last_stripe_datum =
      input_string
      |> stripe_data
      |> List.last

    last_stripe_datum[:total_length]
  end
  def height(input_string), do: width(input_string)
end
