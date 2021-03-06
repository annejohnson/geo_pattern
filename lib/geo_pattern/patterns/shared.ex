defmodule GeoPattern.Patterns.Shared do
  @moduledoc false

  alias GeoPattern.Utils
  alias GeoPattern.SVG.{Node, NodeCollection}

  @hex_color_regex ~r/\A#([[:xdigit:]]{3,3}|[[:xdigit:]]{6,6})\Z/

  defmacro __using__(_) do
    quote do
      @moduledoc false

      alias GeoPattern.Utils
      alias GeoPattern.SVG.{Node, NodeCollection}

      def generate(input_string, options \\ []) do
        unquote(__MODULE__).wrap_pattern_nodes(
          input_string,
          pattern_nodes(input_string),
          width(input_string),
          height(input_string),
          options
        )
      end
    end
  end

  def wrap_pattern_nodes(input_string,
                         nodes,
                         width,
                         height,
                         options) do
    bg_color_string = background_color_string(input_string, options)

    NodeCollection.new([
      Node.svg_header(width, height),
      Node.background(bg_color_string),
      nodes,
      Node.svg_footer
    ])
  end

  def background_color_string(input_string, options) do
    case options[:color] do
      nil ->
        Utils.background_color_string(input_string)
      col ->
        unless String.match?(col, @hex_color_regex) do
          raise ArgumentError,
                message: "Invalid :color option: \"#{col}\". Expected hex format (\"#333\" or \"#a1B318\")."
        end
        col
    end
  end
end
