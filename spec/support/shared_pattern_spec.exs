defmodule GeoPattern.Patterns.SharedPatternSpec do
  use ESpec, shared: true
  alias GeoPattern.SVG.NodeCollection

  describe "generate/1" do
    it "returns the expected SVG string" do
      expect(
        shared.module.generate(shared.input_string)
        |> NodeCollection.new
        |> to_string
      )
      |> to(eq shared.expected_svg_string)
    end
  end

  describe "width/1" do
    it "returns the expected width" do
      expect(
        shared.module.width(shared.input_string)
        |> round
      )
      |> to(eq shared.expected_width)
    end
  end

  describe "height/1" do
    it "returns the expected height" do
      expect(
        shared.module.height(shared.input_string)
        |> round
      )
      |> to(eq shared.expected_height)
    end
  end
end
