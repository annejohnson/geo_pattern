defmodule GeoPatternSpec do
  use ESpec, async: true
  doctest GeoPattern

  let :input, do: "once upon a time"

  describe "generate/1" do
    context "when passed an input string" do
      it "returns an SVG NodeCollection" do
        expect described_module.generate(input)
        |> to(be_struct GeoPattern.SVG.NodeCollection)
      end
    end
  end

  describe "generate/2" do
    context "when a color option is given" do
      let :color, do: "#a133b6"

      it "sets the background as the specified color" do
        background_node =
          input
          |> described_module.generate(color: color)
          |> Map.fetch!(:nodes)
          |> Enum.at(1)

        expect background_node.attrs[:fill]
        |> to(eq color)
      end
    end

    context "when a valid pattern is given" do
      let :circle_pattern, do: :concentric_circles
      let :path_pattern, do: :sine_waves

      it "generates the specified pattern" do
        generated_circle_pattern =
          input
          |> described_module.generate(pattern: circle_pattern)
          |> to_string

        expect generated_circle_pattern |> to(match "circle")
        expect generated_circle_pattern |> to_not(match "path")

        generated_path_pattern =
          input
          |> described_module.generate(pattern: path_pattern)
          |> to_string

        expect generated_path_pattern |> to(match "path")
        expect generated_path_pattern |> to_not(match "circle")
      end
    end

    context "when an invalid pattern is given" do
    end
  end
end
