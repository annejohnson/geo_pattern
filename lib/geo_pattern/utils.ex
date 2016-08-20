defmodule GeoPattern.Utils do
  alias GeoPattern.Seed
  alias GeoPattern.Color.{RGB, HSL}
  require Integer

  def hex_int(input_string, index, len \\ 1) do
    Seed.to_integer(input_string, index, len)
  end

  def remap(value, value_min, value_max, new_min, new_max) do
    num_decimal_places = 1

    value_float = value / 1
    value_range = value_max - value_min
    new_range = new_max - new_min

    ((value_float - value_min) * new_range / value_range + new_min)
    |> Float.round(num_decimal_places)
  end

  def hex_remap(hex_int, new_min, new_max) do
    remap(hex_int, 0, 15, new_min, new_max)
  end

  def opacity(hex_int) do
    opacity_min = 0.02
    opacity_max = 0.15

    hex_remap(hex_int, opacity_min, opacity_max)
  end

  def stroke_opacity, do: 0.02
  def stroke_color, do: "#000"

  def fill_color(hex_int) do
    if Integer.is_even(hex_int) do
      "#DDD"
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
    |> to_string
  end

  def snake_case_to_module_case(string) do
    string
    |> String.split("_")
    |> Stream.map(&String.capitalize/1)
    |> Enum.join
  end

  def pattern_atom(input_string) do
    available_pattern_atoms = GeoPattern.Patterns.pattern_atoms
    pattern_idx = Enum.min([
      hex_int(input_string, 20, 1),
      tuple_size(available_pattern_atoms) - 1
    ])

    elem(available_pattern_atoms, pattern_idx)
  end
end
