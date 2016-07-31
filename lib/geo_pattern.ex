defmodule GeoPattern do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{NodeCollection, Node}

  def generate(input_string, options \\ []) do
    pattern_module = input_string
                     |> pattern_module(options)

    input_string
    |> svg_collection(pattern_module)
  end

  def pattern_module(_input_string, options \\ []) do
    case options[:pattern] do
      nil ->
        GeoPattern.Patterns.ConcentricCircles
      pattern_atom ->
        Utils.atom_to_pattern_module(pattern_atom)
    end
  end

  def generate_to_file(input_string, filename, options \\ []) do
    {:ok, file} = File.open(filename, [:write])
    svg_string = input_string
                 |> GeoPattern.generate(options)
                 |> to_string

    IO.binwrite(file, svg_string)
    File.close(file)
  end

  defp svg_collection(input_string, pattern_module) do
    width = pattern_module.width(input_string)
    height = pattern_module.height(input_string)
    background_color_string = Utils.background_color_string(input_string)

    NodeCollection.new([
      Node.svg_header(width, height),
      Node.background(background_color_string),
      pattern_module.generate(input_string),
      Node.svg_footer
    ])
  end
end
