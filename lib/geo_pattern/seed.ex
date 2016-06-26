defmodule GeoPattern.Seed do
  def get_hexdigest(input_string) do
    :crypto.hash(:sha, input_string)
    |> Base.encode16
  end

  def to_integer(input_string, index, len \\ 1) do
    hex_string = input_string
                 |> get_hexdigest
                 |> String.slice(index, len)
    {integer, _} = Integer.parse(hex_string, 16)
    integer
  end
end
