defmodule GeoPattern.Color do
  alias GeoPattern.Color.RGB

  def from_html(hex_string), do: RGB.new(hex_string)

  def to_svg(hex_string) when is_binary(hex_string) do
    hex_string
    |> from_html
    |> to_svg
  end
  def to_svg(rgb_color), do: RGB.to_svg(rgb_color)
end
