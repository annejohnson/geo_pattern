defmodule GeoPattern.Patterns.Shared do
  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  defmacro __using__(_) do
    quote do
      alias GeoPattern.Utils
      alias GeoPattern.SVG.{Node, NodeCollection}

      def generate(input_string, _options \\ []) do
        unquote(__MODULE__).wrap_pattern_nodes(
          input_string,
          pattern_nodes(input_string),
          width(input_string),
          height(input_string)
        )
      end
    end
  end

  def wrap_pattern_nodes(input_string, nodes, width, height) do
    background_color_string = Utils.background_color_string(input_string)

    NodeCollection.new([
      Node.svg_header(width, height),
      Node.background(background_color_string),
      nodes,
      Node.svg_footer
    ])
  end
end
