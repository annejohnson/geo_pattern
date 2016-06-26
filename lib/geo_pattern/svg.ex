defmodule GeoPattern.SVG do
  alias GeoPattern.{SVGNode, Color}

  def to_string(node_list) do
    node_list
    |> Enum.map(&SVGNode.to_string/1)
    |> Enum.join("")
  end

  def background(hex_color) do
    rect(0, 0, "100%", "100%", fill: Color.to_svg(hex_color))
  end

  def rect(x, y, width, height, attrs \\ []) do
    attrs_to_write = Keyword.merge(attrs, [x: x, y: y, width: width, height: height])
    [%SVGNode{name: "rect", self_closing: true, attrs: attrs_to_write}]
  end

  def circle(cx, cy, r) do
    attrs = [cx: cx, cy: cy, r: r]
    [%SVGNode{name: "circle", self_closing: true, attrs: attrs}]
  end

  def path(str) do
    [%SVGNode{name: "path", self_closing: true, attrs: [d: str]}]
  end

  def polyline(str) do
    [%SVGNode{name: "polyline", self_closing: true, attrs: [points: str]}]
  end

  def group(node_list) do
    List.flatten([
      %SVGNode{name: "g"},
      node_list,
      %SVGNode{name: "g", closing: true}
    ])
  end

  def svg_header(width, height) do
    attrs = [xmlns: "http://www.w3.org/2000/svg", width: width, height: height]
    [%SVGNode{name: "svg", attrs: attrs}]
  end

  def svg_footer do
    [%SVGNode{name: "svg", closing: true}]
  end
end
