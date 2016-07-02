defmodule GeoPattern.Color do
  alias GeoPattern.Color.RGB

  def from_html(hex_string), do: RGB.new(hex_string)

  def to_svg(hex_string) when is_binary(hex_string) do
    hex_string
    |> from_html
    |> RGB.to_svg
  end
end
