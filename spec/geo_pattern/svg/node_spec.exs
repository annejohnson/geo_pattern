defmodule GeoPattern.SVG.NodeSpec do
  use ESpec
  doctest GeoPattern.SVG.Node

  describe "new/2" do
    context "with a self-closing SVG node" do
      let :svg_node do
        GeoPattern.SVG.Node.new(
          "circle",
          self_closing: true,
          attrs: [cx: 5, cy: 2, r: 10]
        )
      end

      let :expected_string, do: ~s[<circle cx="5" cy="2" r="10" />]

      it "returns a Node struct" do
        expect svg_node
        |> to(be_struct described_module)
      end

      it "becomes the expected string" do
        expect to_string(svg_node)
        |> to(eq expected_string)
      end
    end

    context "with a closing SVG node" do
      let :svg_node, do: GeoPattern.SVG.Node.new("svg", closing: true)

      let :expected_string, do: "</svg>"

      it "becomes the expected string" do
        expect to_string(svg_node)
        |> to(eq expected_string)
      end
    end

    context "with an opening SVG node with attributes" do
      let :svg_node, do: GeoPattern.SVG.Node.new("g", attrs: [width: 101, stroke_opacity: 0.5])

      let :expected_string, do: ~s[<g width="101" stroke-opacity="0.5">]

      it "becomes the expected string" do
        expect to_string(svg_node)
        |> to(eq expected_string)
      end
    end
  end
end
