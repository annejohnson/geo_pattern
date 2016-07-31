defmodule GeoPattern.Patterns.SquaresSpec do
  use ESpec
  doctest GeoPattern.Patterns.Squares
  alias GeoPattern.SVG.NodeCollection

  let :input_string, do: "hello"

  describe "generate/1" do
    let :expected_svg_string do
      ~s(<rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="0.0" y="0.0" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="43.3" y="0.0" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" x="86.6" y="0.0" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="129.89999999999998" y="0.0" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="173.2" y="0.0" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="216.5" y="0.0" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" x="0.0" y="43.3" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="43.3" y="43.3" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="86.6" y="43.3" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="129.89999999999998" y="43.3" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="173.2" y="43.3" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="216.5" y="43.3" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="0.0" y="86.6" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="43.3" y="86.6" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="86.6" y="86.6" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" x="129.89999999999998" y="86.6" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="173.2" y="86.6" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="216.5" y="86.6" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="0.0" y="129.89999999999998" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="43.3" y="129.89999999999998" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="86.6" y="129.89999999999998" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="129.89999999999998" y="129.89999999999998" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" x="173.2" y="129.89999999999998" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" x="216.5" y="129.89999999999998" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" x="0.0" y="173.2" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="43.3" y="173.2" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="86.6" y="173.2" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="129.89999999999998" y="173.2" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" x="173.2" y="173.2" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="216.5" y="173.2" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="0.0" y="216.5" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="43.3" y="216.5" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="86.6" y="216.5" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="129.89999999999998" y="216.5" width="43.3" height="43.3" /><rect fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="173.2" y="216.5" width="43.3" height="43.3" /><rect fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" x="216.5" y="216.5" width="43.3" height="43.3" />)
    end

    it "returns the expected SVG string" do
      expect(
        described_module.generate(input_string)
        |> NodeCollection.new
        |> to_string
      )
      |> to(eq expected_svg_string)
    end
  end

  describe "width/1" do
    let :expected_width, do: 260

    it "returns the expected width" do
      expect(
        described_module.width(input_string)
        |> round
      )
      |> to(eq expected_width)
    end
  end

  describe "height/1" do
    let :expected_height, do: 260

    it "returns the expected height" do
      expect(
        described_module.height(input_string)
        |> round
      )
      |> to(eq expected_height)
    end
  end
end
