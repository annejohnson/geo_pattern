defmodule GeoPattern do
  alias GeoPattern.SVG

  def generate(input_string, options \\ []) do
    pattern_module = GeoPattern.Patterns.Squares
    width = pattern_module.width(input_string)
    height = pattern_module.height(input_string)

    svg_nodes = SVG.svg_header(width, height) ++
                SVG.background("#336699") ++
                pattern_module.generate(input_string) ++
                SVG.svg_footer

    SVG.to_string(svg_nodes)
  end

  def generate_to_file(input_string, filename) do
    {:ok, file} = File.open(filename, [:write])
    svg_string = GeoPattern.generate(input_string)

    IO.binwrite(file, svg_string)
    File.close(file)
  end
end
