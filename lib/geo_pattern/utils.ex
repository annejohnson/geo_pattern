defmodule GeoPattern.Utils do
  alias GeoPattern.Seed

  def hex_val(input_string, index, len \\ 1) do
    Seed.to_integer(input_string, index, len)
  end

  def remap(value, value_min, value_max, new_min, new_max) do
    value_float = value / 1
    value_range = value_max - value_min
    new_range = new_max - new_min

    (value_float - value_min) * new_range / value_range + new_min
  end
end
