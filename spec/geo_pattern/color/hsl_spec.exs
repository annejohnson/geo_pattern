defmodule GeoPattern.Color.HSLSpec do
  use ESpec
  doctest GeoPattern.Color.HSL

  let :delta, do: 0.0001

  describe "new/1" do
    let :hex_string, do: "#115500"
    let :expected_hue, do: 108.0
    let :expected_saturation, do: 100.0
    let :expected_lightness, do: 16.6666667

    it "generates the expected HSL color" do
      hue_color = described_module.new(hex_string)

      expect hue_color.hue
      |> to(be_close_to expected_hue, delta)

      expect hue_color.saturation
      |> to(be_close_to expected_saturation, delta)

      expect hue_color.lightness
      |> to(be_close_to expected_lightness, delta)
    end
  end
end
