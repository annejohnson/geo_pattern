defmodule GeoPattern.ColorSpec do
  use ESpec
  doctest GeoPattern.SVGNode

  describe "to_svg/1" do
    context "when passed a hex string" do
      context "when hex string contains 3 characters" do
        let :hex_string, do: "#fff"
        let :expected_svg_string, do: "rgb(255, 255, 255)"

        it "generates the expected SVG string" do
          expect described_module.to_svg(hex_string)
          |> to(eq expected_svg_string)
        end
      end

      context "when hex string contains 6 characters" do
        let :hex_string, do: "#915c83"
        let :expected_svg_string, do: "rgb(145, 92, 131)"

        it "generates the expected SVG string" do
          expect described_module.to_svg(hex_string)
          |> to(eq expected_svg_string)
        end
      end
    end
  end
end
