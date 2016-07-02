defmodule GeoPattern.Color.HSLSpec do
  use ESpec
  doctest GeoPattern.Color.HSL
  alias GeoPattern.Color.{RGB, HSL}

  describe "new/1" do
    context "when passed an RGB color" do
      let :rgb_color, do: RGB.new("#115500")
      let :expected_hue, do: 108.0
      let :expected_saturation, do: 100.0
      let :expected_lightness, do: 16.6666667
      let :delta, do: 0.0001

      it "generates the expected HSL color" do
        hue_color = described_module.new(rgb_color)

        expect hue_color.hue
        |> to(be_close_to expected_hue, delta)

        expect hue_color.saturation
        |> to(be_close_to expected_saturation, delta)

        expect hue_color.lightness
        |> to(be_close_to expected_lightness, delta)
      end
    end
  end
end
