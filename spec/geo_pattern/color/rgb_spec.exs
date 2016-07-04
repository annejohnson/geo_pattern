defmodule GeoPattern.Color.RGBSpec do
  use ESpec
  doctest GeoPattern.Color.RGB

  describe "an RGB struct" do
    it "implements the String.Chars protocol" do
      color_string = "#aa67bb"
      rgb_color = described_module.new(color_string)

      expect to_string(rgb_color)
      |> to(match ~r/#{color_string}/i)
    end
  end
end
