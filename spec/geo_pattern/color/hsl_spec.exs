defmodule GeoPattern.Color.HSLSpec do
  use ESpec
  doctest GeoPattern.Color.HSL

  let :delta, do: 0.5
  let :color_data do
    [
      # blue
      %{
        hex_string: "#adc7ff",
        hue: 221.0,
        saturation: 100.0,
        lightness: 84.0,
        red: 173,
        green: 199,
        blue: 255
      },
      # green
      %{
        hex_string: "#115500",
        hue: 108.0,
        saturation: 100.0,
        lightness: 16.7,
        red: 17,
        green: 85,
        blue: 0
      },
      # yellow
      %{
        hex_string: "#e3e345",
        hue: 60.0,
        saturation: 74.0,
        lightness: 58.0,
        red: 227,
        green: 227,
        blue: 69
      },
      # red orange
      %{
        hex_string: "#8d5c44",
        hue: 20.0,
        saturation: 35.0,
        lightness: 41.0,
        red: 141,
        green: 92,
        blue: 68
      },
      # red violet
      %{
        hex_string: "#b8194e",
        hue: 340.0,
        saturation: 76.1,
        lightness: 41.0,
        red: 184,
        green: 25,
        blue: 78
      },
      # gray
      %{
        hex_string: "#444",
        hue: 0.0,
        saturation: 0.0,
        lightness: 27.0,
        red: 68,
        green: 68,
        blue: 68
      }
    ]
  end

  describe "new/1" do
    it "generates the expected HSL color" do
      Enum.each(
        color_data,
        fn(%{hex_string: hex_string, hue: hue, saturation: saturation, lightness: lightness}) ->
          hue_color = described_module.new(hex_string)

          expect hue_color.hue
          |> to(be_close_to hue, delta)

          expect hue_color.saturation
          |> to(be_close_to saturation, delta)

          expect hue_color.lightness
          |> to(be_close_to lightness, delta)
        end
      )
    end
  end

  describe "to_rgb/1" do
    it "generates the expected RGB color" do
      Enum.each(
        color_data,
        fn(%{hex_string: hex_string, red: red, green: green, blue: blue}) ->
          rgb_color = hex_string
                      |> described_module.new
                      |> described_module.to_rgb

          expect rgb_color.red
          |> to(eq red)

          expect rgb_color.green
          |> to(eq green)

          expect rgb_color.blue
          |> to(eq blue)
        end
      )
    end
  end
end
