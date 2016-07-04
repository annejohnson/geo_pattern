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

      it "returns a Node struct" do
        expect svg_node
        |> to(be_struct described_module)
      end

      it "becomes the expected string" do
        expected_string = ~s[<circle cx="5" cy="2" r="10" />]

        expect to_string(svg_node)
        |> to(eq expected_string)
      end
    end

    context "with a closing SVG node" do
      let :svg_node, do: GeoPattern.SVG.Node.new("svg", closing: true)

      it "becomes the expected string" do
        expected_string = "</svg>"

        expect to_string(svg_node)
        |> to(eq expected_string)
      end
    end

    context "with an opening SVG node with attributes" do
      let :svg_node, do: GeoPattern.SVG.Node.new("g", attrs: [width: 101, stroke_opacity: 0.5])

      it "becomes the expected string" do
        expected_string = ~s[<g width="101" stroke-opacity="0.5">]

        expect to_string(svg_node)
        |> to(eq expected_string)
      end
    end
  end

  describe "background/1" do
    it "creates a full width and full height rectangle with the specified fill color" do
      color_string = "#5133aa"
      background_node = described_module.background(color_string)

      expect background_node.name
      |> to(eq "rect")

      expect background_node.self_closing
      |> to(be_truthy)

      expect background_node.closing
      |> to(be_falsy)

      expect Keyword.get(background_node.attrs, :fill)
      |> to(eq color_string)

      expect Keyword.get(background_node.attrs, :width)
      |> to(eq "100%")

      expect Keyword.get(background_node.attrs, :height)
      |> to(eq "100%")
    end
  end

  describe "rect/5" do
    it "creates a rectangle node with the specified attributes" do
      x = 5
      y = 8
      width = 30
      height = 40
      stroke_color = "#555"
      attrs = [stroke_color: stroke_color]

      rectangle_node = described_module.rect(x, y, width, height, attrs)

      expect rectangle_node.name
      |> to(eq "rect")

      expect Keyword.get(rectangle_node.attrs, :x)
      |> to(eq x)

      expect Keyword.get(rectangle_node.attrs, :y)
      |> to(eq y)

      expect Keyword.get(rectangle_node.attrs, :width)
      |> to(eq width)

      expect Keyword.get(rectangle_node.attrs, :height)
      |> to(eq height)

      expect Keyword.get(rectangle_node.attrs, :stroke_color)
      |> to(eq stroke_color)

      expect rectangle_node.self_closing
      |> to(be_truthy)

      expect rectangle_node.closing
      |> to(be_falsy)
    end
  end
end
