defmodule GeoPattern do
  alias GeoPattern.{Patterns, Utils}
  alias GeoPattern.SVG.{NodeCollection, Node}

  def generate(input_string, options \\ []) do
    pattern_module = pattern_module(input_string, options)

    svg_collection(input_string, pattern_module)
  end

  def generate_to_file(input_string, filename, options \\ []) do
    {:ok, file} = File.open(filename, [:write])
    svg_string = input_string
                 |> GeoPattern.generate(options)
                 |> to_string

    IO.binwrite(file, svg_string)
    File.close(file)
  end

  defp pattern_module(input_string, options \\ []) do
    pattern_atom = options[:pattern] ||
                   Utils.pattern_atom(input_string)
    Patterns.pattern_atom_to_module(pattern_atom)
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
