defmodule GeoPattern do
  alias GeoPattern.{SVG, Utils}

  def generate(input_string, _options \\ []) do
    pattern_module = pattern_module(input_string)

    input_string
    |> svg_nodes(pattern_module)
    |> SVG.to_string
  end

  def pattern_module(_input_string) do
    GeoPattern.Patterns.Squares
  end

  def generate_to_file(input_string, filename) do
    {:ok, file} = File.open(filename, [:write])
    svg_string = GeoPattern.generate(input_string)

    IO.binwrite(file, svg_string)
    File.close(file)
  end

  defp svg_nodes(input_string, pattern_module) do
    width = pattern_module.width(input_string)
    height = pattern_module.height(input_string)
    base_color = Utils.base_color(input_string)

    SVG.svg_header(width, height) ++
      SVG.background(base_color) ++
      pattern_module.generate(input_string) ++
      SVG.svg_footer
  end
end
