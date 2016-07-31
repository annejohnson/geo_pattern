defmodule GeoPatternSpec do
  use ESpec, async: true
  doctest GeoPattern

  describe "generate/1" do
    context "when passed an input string" do
      let :input, do: "hello, world"

      it "returns an SVG NodeCollection" do
        expect described_module.generate(input)
        |> to(be_struct GeoPattern.SVG.NodeCollection)
      end
    end
  end

  describe "generate/2" do
    context "when an invalid option is given" do
    end

    context "when a base color is given" do
    end

    context "when a color is given" do
    end

    context "when multiple patterns are given" do
    end

    context "when a valid pattern is given" do
    end

    context "when invalid patterns are given" do
    end
  end
end
