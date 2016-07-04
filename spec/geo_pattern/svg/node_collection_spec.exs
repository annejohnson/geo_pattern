defmodule GeoPattern.SVG.NodeCollectionSpec do
  use ESpec
  doctest GeoPattern.SVG.NodeCollection
  alias GeoPattern.SVG.Node

  describe "new/1" do
    let :node_list do
      [
        Node.new("g", attrs: [width: 5]),
        Node.new("g", closing: true)
      ]
    end

    let :node_collection, do: described_module.new(node_list)

    it "returns a NodeCollection" do
      expect node_collection
      |> to(be_struct described_module)
    end

    it "returns a struct that implements the String.Chars protocol" do
      expected_string = ~s[<g width="5"></g>]

      expect to_string(node_collection)
      |> to(eq expected_string)
    end

    it "returns a struct with the list of nodes" do
      expect node_collection.nodes
      |> to(eq node_list)
    end
  end

  describe "group/1" do
    let :node_list do
      [
        Node.rect(50, 50, 50, 50),
        Node.circle(5, 30, 20)
      ]
    end

    let :result, do: described_module.group(node_list)

    it "contains an opening g node" do
      g_node = hd(result.nodes)

      expect g_node.name
      |> to(eq "g")

      expect g_node.closing
      |> to(eq false)
    end

    it "contains the node list between the opening and closing g nodes" do
      body_nodes = tl(result.nodes)
                   |> List.delete_at(-1)
      expect body_nodes
      |> to(eq node_list)
    end

    it "contains a closing g node" do
      g_node = List.last(result.nodes)

      expect g_node.name
      |> to(eq "g")

      expect g_node.closing
      |> to(eq true)
    end
  end
end
