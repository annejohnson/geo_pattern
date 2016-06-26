defmodule GeoPattern.Color do
  defstruct red: 0.0, green: 0.0, blue: 0.0

  def from_html(hex_string) do
    [red, green, blue] =
      hex_string
      |> remove_non_hex_chars
      |> String.split("", trim: true)
      |> chunk_to_red_green_blue
      |> Enum.map(&hex_string_to_float/1)

    %GeoPattern.Color{red: red, green: green, blue: blue}
  end

  def hex_string_to_float(hex_string) do
    {int, _} = Integer.parse(hex_string, 16)
    int / 255
  end

  def chunk_to_red_green_blue(hex_chars) when length(hex_chars) == 6 do
    hex_chars
    |> Enum.chunk(2)
    |> Enum.map(&Enum.join/1)
  end
  def chunk_to_red_green_blue(hex_chars) when length(hex_chars) == 3 do
    hex_chars
    |> Enum.map(fn(char) -> char <> char end)
  end

  def remove_non_hex_chars(hex_string) do
    hex_string
    |> String.replace(~r/[[:^xdigit:]]/, "")
  end
end
