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

  def h(%GeoPattern.Color.HSL{hue: hue}), do: hue / 360.0
  def s(%GeoPattern.Color.HSL{saturation: saturation}), do: saturation / 100.0
  def l(%GeoPattern.Color.HSL{lightness: lightness}), do: lightness / 100.0

  def to_rgb(hsl_color) do
    [h, s, l] = [
      GeoPattern.Color.HSL.h(hsl_color),
      GeoPattern.Color.HSL.s(hsl_color),
      GeoPattern.Color.HSL.l(hsl_color)
    ]

    [r, g, b] =
      if s == 0 do
        [l, l, l]
      else
        q =
          if l < 0.5 do
            l * (1 + s)
          else
            l + s - (l * s)
          end
        p = (2 * l) - q

        [
          hue_to_rgb(p, q, h + 1/3),
          hue_to_rgb(p, q, h),
          hue_to_rgb(p, q, h - 1/3)
        ]
      end

    RGB.new(r, g, b)
  end

  defp get_lightness(r, g, b) do
    min = Enum.min([r, g, b])
    max = Enum.max([r, g, b])

    ((min + max) / 2.0) * 100.0
  end

  defp get_saturation(r, g, b) do
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

  defp get_hue(r, g, b) do
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

  defp hue_to_rgb(p, q, t) do
    t = cond do
      t < 0 -> t + 1
      t > 1 -> t - 1
      :else -> t
    end

    cond do
      t < 1/6 ->
        p + (q - p) * 6 * t
      t < 1/2 ->
        q
      t < 2/3 ->
        p + (q - p) * (2/3 - t) * 6
      :else ->
        p
    end
  end
end

defimpl String.Chars, for: GeoPattern.Color.HSL do
  def to_string(hsl_color) do
    hsl_color
    |> GeoPattern.Color.HSL.to_rgb
    |> Kernel.to_string
  end
end
