defmodule GeoPattern.Utils do
  alias GeoPattern.Seed
  alias GeoPattern.Color.{RGB, HSL}
  require Integer

  def hex_int(input_string, index, len \\ 1) do
    Seed.to_integer(input_string, index, len)
  end

  def remap(value, value_min, value_max, new_min, new_max) do
    value_float = value / 1
    value_range = value_max - value_min
    new_range = new_max - new_min

    (value_float - value_min) * new_range / value_range + new_min
  end

  def opacity(hex_int) do
    opacity_min = 0.02
    opacity_max = 0.15
    remap(hex_int, 0, 15, opacity_min, opacity_max)
  end

  def stroke_opacity, do: 0.02
  def stroke_color, do: "#000"

  def fill_color(hex_int) do
    if Integer.is_even(hex_int) do
      "#ddd"
    else
      "#222"
    end
  end

  def transform_color(input_string, rgb_color) do
    hsl_color =
      %HSL{hue: hue, saturation: saturation} =
        HSL.new(rgb_color)

    hue_offset = input_string
                 |> hex_int(14, 3)
                 |> remap(0, 4095, 0, 359)
    saturation_offset = input_string
                        |> hex_int(17, 1)
                        |> round

    new_hue = hue - hue_offset
    new_saturation =
      if Integer.is_even(saturation_offset) do
        saturation + saturation_offset
      else
        saturation - saturation_offset
      end

    %{hsl_color | hue: new_hue, saturation: new_saturation}
    |> HSL.to_rgb
  end

  def background_color_string(input_string) do
    seed_rgb_color = Seed.hex_color_string
                     |> RGB.new

    input_string
    |> transform_color(seed_rgb_color)
    |> RGB.to_svg
  end
end
