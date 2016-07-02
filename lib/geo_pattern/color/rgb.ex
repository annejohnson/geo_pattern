defmodule GeoPattern.Color.RGB do
  defstruct [:red, :green, :blue]
  @hex_max 255

  def new("#" <> hex_string) do
    [red, green, blue] =
      hex_string
      |> String.split("", trim: true)
      |> chunk_to_red_green_blue_strings
      |> Enum.map(&hex_string_to_num/1)

    %GeoPattern.Color.RGB{red: red, green: green, blue: blue}
  end
  def new(r, g, b) do
    red = round(r * @hex_max)
    green = round(g * @hex_max)
    blue = round(b * @hex_max)

    %GeoPattern.Color.RGB{red: red, green: green, blue: blue}
  end

  def to_hsl(rgb_color), do: GeoPattern.Color.HSL.new(rgb_color)

  def r(%GeoPattern.Color.RGB{red: red}), do: red / @hex_max
  def g(%GeoPattern.Color.RGB{green: green}), do: green / @hex_max
  def b(%GeoPattern.Color.RGB{blue: blue}), do: blue / @hex_max

  def to_svg(%GeoPattern.Color.RGB{red: red, green: green, blue: blue}) do
    ~s/rgb(#{red}, #{green}, #{blue})/
  end

  defp hex_string_to_num(hex_string) do
    {num, _} = Integer.parse(hex_string, 16)
    num
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
