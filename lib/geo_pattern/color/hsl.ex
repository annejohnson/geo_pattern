defmodule GeoPattern.Color.HSL do
  defstruct [:hue, :saturation, :lightness]
  alias GeoPattern.Color.RGB

  def new(hex_string) when is_binary(hex_string) do
    hex_string |> RGB.new |> new
  end
  def new(rgb_color) do
    [r, g, b] = [
      RGB.r(rgb_color),
      RGB.g(rgb_color),
      RGB.b(rgb_color)
    ]

    %GeoPattern.Color.HSL{
      hue: get_hue(r, g, b),
      saturation: get_saturation(r, g, b),
      lightness: get_lightness(r, g, b)
    }
  end

  def get_lightness(r, g, b) do
    min = Enum.min([r, g, b])
    max = Enum.max([r, g, b])

    ((min + max) / 2.0) * 100.0
  end

  def get_saturation(r, g, b) do
    min = Enum.min([r, g, b])
    max = Enum.max([r, g, b])

    cond do
      min == max ->
        0
      get_lightness(r, g, b) <= 50 ->
        (max - min) / (max + min)
      :else ->
        (max - min) / (2.0 - max - min)
    end * 100.0
  end

  def get_hue(r, g, b) do
    cond do
      r == g && g == b ->
        0
      r >= g && g >= b ->
        (g - b) / (r - b)
      g > r && r >= b ->
        2.0 - (r - b) / (g - b)
      g >= b && b > r ->
        2.0 + (b - r) / (g - r)
      b > g && g > r ->
        4.0 - (g - r) / (b - r)
      b > r && r >= g ->
        4.0 + (r - g) / (b - g)
      :else ->
        6.0 - (b - g) / (r - g)
    end * 60.0
  end
end
