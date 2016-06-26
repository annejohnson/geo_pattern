defmodule GeoPattern do
  alias GeoPattern.SVG

  def generate(input_string, options \\ []) do
    svg_nodes = SVG.svg_header ++
                SVG.background("#336699") ++
                SVG.svg_footer
    SVG.to_string(svg_nodes)
  end
end
