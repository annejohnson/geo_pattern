defmodule GeoPattern.Color do
  alias GeoPattern.Color.RGB

  @hex_max 255

  def from_html(hex_string) do
    [red, green, blue] =
      hex_string
      |> remove_non_hex_chars
      |> String.split("", trim: true)
      |> chunk_to_red_green_blue_strings
      |> Enum.map(&hex_string_to_float/1)

    %RGB{red: red, green: green, blue: blue}
  end

  def to_svg(%RGB{red: red, green: green, blue: blue}) do
    [r, g, b] = [red, green, blue]
                |> Enum.map(fn(color_decimal) -> color_decimal * @hex_max end)
                |> Enum.map(&round/1)
    ~s/rgb(#{r}, #{g}, #{b})/
  end
  def to_svg(hex_string) do
    hex_string |> from_html |> to_svg
  end

  def hex_string_to_float(hex_string) do
    {int, _} = Integer.parse(hex_string, 16)
    int / @hex_max
  end

  def chunk_to_red_green_blue_strings(hex_chars) when length(hex_chars) == 6 do
    hex_chars
    |> Enum.chunk(2)
    |> Enum.map(&Enum.join/1)
  end
  def chunk_to_red_green_blue_strings(hex_chars) when length(hex_chars) == 3 do
    hex_chars
    |> Enum.map(fn(char) -> char <> char end)
  end

  def remove_non_hex_chars(hex_string) do
    hex_string
    |> String.replace(~r/[[:^xdigit:]]/, "")
  end
end
