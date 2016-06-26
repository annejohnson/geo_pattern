defmodule GeoPattern do
  alias GeoPattern.SVG

  def generate(input_string, options \\ []) do
    svg_nodes = SVG.svg_header ++
                SVG.background("#336699") ++
                GeoPattern.Patterns.Squares.generate(input_string, options) ++
                SVG.svg_footer
    SVG.to_string(svg_nodes)
  end
end
