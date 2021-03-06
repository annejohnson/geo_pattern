defmodule GeoPattern.Patterns.SharedPatternSpec do
  use ESpec, shared: true

  describe "pattern_nodes/1" do
    it "returns the expected SVG string" do
      expect(
        shared.input_string
        |> shared.module.pattern_nodes
        |> to_string
      )
      |> to(eq shared.expected_svg_string)
    end
  end

  describe "width/1" do
    it "returns the expected width" do
      expect(
        shared.input_string
        |> shared.module.width
        |> round
      )
      |> to(eq shared.expected_width)
    end
  end

  describe "height/1" do
    it "returns the expected height" do
      expect(
        shared.input_string
        |> shared.module.height
        |> round
      )
      |> to(eq shared.expected_height)
    end
  end

  it "is in the list of pattern modules" do
    Enum.member?(
      GeoPattern.Patterns.pattern_modules,
      shared.module
    )
  end
end
