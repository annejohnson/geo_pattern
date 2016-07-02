defmodule GeoPattern.Color.HSLSpec do
  use ESpec
  doctest GeoPattern.Color.HSL

  let :delta, do: 0.0001

  describe "new/1" do
    let :color_data do
      [
        %{
          hex_string: "#115500",
          hue: 108.0,
          saturation: 100.0,
          lightness: 16.666667
        },
        %{
          hex_string: "#b8194e",
          hue: 340.0,
          saturation: 76.076555,
          lightness: 40.9803921
        }
      ]
    end

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
end
