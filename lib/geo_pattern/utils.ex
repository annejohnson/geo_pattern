defmodule GeoPattern.Utils do
  alias GeoPattern.Seed
  require Integer

  def hex_val(input_string, index, len \\ 1) do
    Seed.to_integer(input_string, index, len)
  end

  def remap(value, value_min, value_max, new_min, new_max) do
    value_float = value / 1
    value_range = value_max - value_min
    new_range = new_max - new_min

    (value_float - value_min) * new_range / value_range + new_min
  end

  def opacity(hex_val) do
    opacity_min = 0.02
    opacity_max = 0.15
    remap(hex_val, 0, 15, opacity_min, opacity_max)
  end

  def stroke_opacity, do: 0.02
  def stroke_color, do: "#000"

  def fill_color(hex_val) do
    if Integer.is_even(round(hex_val)) do
      "#ddd"
    else
      "#222"
    end
  end
end
