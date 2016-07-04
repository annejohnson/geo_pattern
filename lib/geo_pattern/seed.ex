defmodule GeoPattern.Seed do
  def get_hexdigest(input_string) do
    :crypto.hash(:sha, input_string)
    |> Base.encode16
  end

  def to_integer(input_string, index, len \\ 1) do
    full_hex_string = get_hexdigest(input_string)
    normalized_index = rem(index, String.length(full_hex_string))

    hex_substring = full_hex_string
                    |> String.slice(normalized_index, len)

    {integer, _} = Integer.parse(hex_substring, 16)
    integer
  end

  def hex_color_string, do: "#336699"
end
