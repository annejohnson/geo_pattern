defmodule GeoPattern.SVG.NodeCollection do
  defstruct nodes: []
  alias GeoPattern.SVG.Node

  def new(node_list) when is_list(node_list) do
    struct!(
      __MODULE__,
      nodes: List.flatten(node_list)
    )
  end

  def group(node_list, options \\ []) do
    [
      Node.new("g", attrs: options),
      node_list,
      Node.new("g", closing: true)
    ] |> new
  end
end

defimpl String.Chars, for: GeoPattern.SVG.NodeCollection do
  def to_string(%GeoPattern.SVG.NodeCollection{nodes: node_list}) do
    node_list
    |> Stream.map(&Kernel.to_string/1)
    |> Enum.join("")
  end
end
