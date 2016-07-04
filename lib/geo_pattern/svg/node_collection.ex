defmodule GeoPattern.SVG.NodeCollection do
  defstruct nodes: []
  alias GeoPattern.SVG.Node

  def new(node_list) when is_list(node_list) do
    node_list = List.flatten(node_list)
    struct!(__MODULE__, nodes: node_list)
  end

  def group(%__MODULE__{nodes: node_list}) do
    new([
      Node.new("g"),
      node_list,
      Node.new("g", closing: true)
    ])
  end
  def group(node_list) when is_list(node_list) do
    new(node_list) |> group
  end
end

defimpl String.Chars, for: GeoPattern.SVG.NodeCollection do
  def to_string(%GeoPattern.SVG.NodeCollection{nodes: node_list}) do
    node_list
    |> Stream.map(&Kernel.to_string/1)
    |> Enum.join("")
  end
end
