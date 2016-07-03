defmodule GeoPattern.SVG.NodeSpec do
  use ESpec
  doctest GeoPattern.SVG.Node

  describe "to_string/1" do
    context "with a self-closing SVG node" do
      let :svg_node do
        %GeoPattern.SVG.Node{
          name: "circle",
          self_closing: true,
          attrs: [cx: 5, cy: 2, r: 10]
        }
      end
      let :expected_string, do: ~s[<circle cx="5" cy="2" r="10" />]

      it "generates the correct svg node string" do
        expect described_module.to_string(svg_node)
        |> to(eq expected_string)
      end
    end

    context "with a closing SVG node" do
      let :svg_node, do: %GeoPattern.SVG.Node{name: "svg", closing: true}
      let :expected_string, do: "</svg>"

      it "generates the correct svg node string" do
        expect described_module.to_string(svg_node)
        |> to(eq expected_string)
      end
    end

    context "with an opening SVG node with attributes" do
      let :svg_node, do: %GeoPattern.SVG.Node{name: "g", attrs: [width: 101]}
      let :expected_string, do: ~s[<g width="101">]

      it "generates the correct svg node string" do
        expect described_module.to_string(svg_node)
        |> to(eq expected_string)
      end
    end
  end

  describe "attr_string/1" do
    context "with standard attributes" do
      let :attrs, do: [fill: "rgb(0,0,0)", width: 100]
      let :expected_attr_string, do: ~s[fill="rgb(0,0,0)" width="100"]

      it "generates the correct attribute string" do
        expect described_module.attr_string(attrs)
        |> to(eq expected_attr_string)
      end
    end

    context "with attributes containing underscores" do
      let :attrs, do: [fill_opacity: 0.5, stroke_opacity: 0.8]
      let :expected_attr_string, do: ~s[fill-opacity="0.5" stroke-opacity="0.8"]

      it "replaces attribute underscores with dashes" do
        expect described_module.attr_string(attrs)
        |> to(eq expected_attr_string)
      end
    end
  end
end
