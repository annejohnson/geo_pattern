defmodule GeoPattern.Color.HSL do
  defstruct [:hue, :saturation, :lightness]
  alias GeoPattern.Color.RGB

  def new(%RGB{red: r, green: g, blue: b}) do
    lightness = get_lightness(r, g, b)
    saturation = get_saturation(r, g, b)
    hue = get_hue(r, g, b)

    %GeoPattern.Color.HSL{
      hue: hue,
      saturation: saturation,
      lightness: lightness
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
    min = Enum.min([r, g, b])
    max = Enum.max([r, g, b])

    cond do
      min == max ->
        0
      r == max ->
        (g - b) / (max - min)
      g == max ->
        2.0 + (b - r) / (max - min)
      :else ->
        4.0 + (r - g) / (max - min)
    end * 60.0
  end
end
