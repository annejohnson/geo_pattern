defmodule GeoPattern.Color.RGB do
  defstruct [:red, :green, :blue]
  @hex_max 255

  def new("#" <> hex_string) do
    [red, green, blue] =
      hex_string
      |> String.split("", trim: true)
      |> chunk_to_red_green_blue_strings
      |> Enum.map(&hex_string_to_float/1)

    %GeoPattern.Color.RGB{red: red, green: green, blue: blue}
  end

  def to_svg(%GeoPattern.Color.RGB{red: red, green: green, blue: blue}) do
    [r, g, b] = [red, green, blue]
                |> Stream.map(&(&1 * @hex_max))
                |> Enum.map(&round/1)
    ~s/rgb(#{r}, #{g}, #{b})/
  end

  defp hex_string_to_float(hex_string) do
    {int, _} = Integer.parse(hex_string, 16)
    int / @hex_max
  end

  defp chunk_to_red_green_blue_strings(hex_chars) when length(hex_chars) == 6 do
    hex_chars
    |> Stream.chunk(2)
    |> Stream.map(&Enum.join/1)
  end
  defp chunk_to_red_green_blue_strings(hex_chars) when length(hex_chars) == 3 do
    hex_chars
    |> Stream.map(&(&1 <> &1))
  end
end
