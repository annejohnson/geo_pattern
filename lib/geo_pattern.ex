defmodule GeoPattern do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{NodeCollection, Node}

  def generate(input_string, _options \\ []) do
    pattern_module = pattern_module(input_string)

    input_string
    |> svg_collection(pattern_module)
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

  defp svg_collection(input_string, pattern_module) do
    width = pattern_module.width(input_string)
    height = pattern_module.height(input_string)
    base_color = Utils.base_color(input_string)

    NodeCollection.new([
      Node.svg_header(width, height),
      Node.background(base_color),
      pattern_module.generate(input_string),
      Node.svg_footer
    ])
  end
end
