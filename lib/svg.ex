defmodule SVG do
  defstruct nodes: []

  def to_string(%SVG{nodes: nds}) do
    nds
    |> Enum.map(&SVGNode.to_string/1)
    |> Enum.join("")
  end

  def rect(x, y, width, height) do
    attrs = [x: x, y: y, width: width, height: height]
    %SVG{
      nodes: [%SVGNode{name: "rect", self_closing: true, attrs: attrs}]
    }
  end

  def circle(cx, cy, r) do
    attrs = [cx: cx, cy: cy, r: r]
    %SVG{
      nodes: [%SVGNode{name: "circle", self_closing: true, attrs: attrs}]
    }
  end

  def path(str) do
    %SVG{
      nodes: [%SVGNode{name: "path", self_closing: true, attrs: [d: str]}]
    }
  end

  def polyline(str) do
    %SVG{
      nodes: [%SVGNode{name: "polyline", self_closing: true, attrs: [points: str]}]
    }
  end

  def get_node_list(svg_or_node_list) do
    case svg_or_node_list do
      %SVG{nodes: node_list} ->
        node_list
      node_list ->
        node_list
    end
  end

  def group(svg_or_node_list) do
    %SVG{
      nodes: List.flatten([
        %SVGNode{name: "g"},
        get_node_list(svg_or_node_list),
        %SVGNode{name: "g", closing: true}
      ])
    }
  end

  def svg_header(width \\ 101, height \\ 101) do
    attrs = [xmlns: "http://www.w3.org/2000/svg", width: width, height: height]
    %SVG{
      nodes: [%SVGNode{name: "svg", attrs: attrs}]
    }
  end

  def svg_footer do
    %SVG{
      nodes: [%SVGNode{name: "svg", closing: true}]
    }
  end
end
