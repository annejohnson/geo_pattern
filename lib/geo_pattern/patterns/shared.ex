defmodule GeoPattern.Patterns.Shared do
  defmacro __using__(_) do
    quote do
      alias GeoPattern.Utils
      alias GeoPattern.SVG.{Node, NodeCollection}

      def generate(input_string, _options \\ []) do
        width = width(input_string)
        height = height(input_string)
        background_color_string = Utils.background_color_string(input_string)

        NodeCollection.new([
          Node.svg_header(width, height),
          Node.background(background_color_string),
          pattern_nodes(input_string),
          Node.svg_footer
        ])
      end
    end
  end
end
