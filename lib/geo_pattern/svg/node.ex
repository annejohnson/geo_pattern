defmodule GeoPattern.SVG.Node do
  defstruct name: "svg", self_closing: false, closing: false, attrs: []

  def new(name, options \\ []) do
    node_attrs = options |> Keyword.merge(name: name)
    struct!(__MODULE__, node_attrs)
  end

  def to_string(%__MODULE__{name: name, self_closing: self_closing, closing: closing, attrs: attrs}) do
    prefix = if closing, do: "</", else: "<"
    suffix = if self_closing, do: " />", else: ">"

    middle = [name, attr_string(attrs)]
             |> Stream.filter(&String.first/1)
             |> Enum.join(" ")
    prefix <> middle <> suffix
  end

  def background(fill_string) do
    rect(0, 0, "100%", "100%", fill: fill_string)
  end

  def rect(x, y, width, height, attrs \\ []) do
    attrs_to_write = Keyword.merge(attrs, [x: x, y: y, width: width, height: height])
    new("rect", self_closing: true, attrs: attrs_to_write)
  end

  def circle(cx, cy, r) do
    attrs = [cx: cx, cy: cy, r: r]
    new("circle", self_closing: true, attrs: attrs)
  end

  def path(str) do
    new("path", self_closing: true, attrs: [d: str])
  end

  def polyline(str) do
    new("polyline", self_closing: true, attrs: [points: str])
  end

  def svg_header(width, height) do
    attrs = [xmlns: "http://www.w3.org/2000/svg", width: width, height: height]
    new("svg", attrs: attrs)
  end

  def svg_footer do
    new("svg", closing: true)
  end

  def attr_string(attrs) when is_list(attrs) do
    attrs
    |> Stream.map(fn({attr_name, attr_value}) ->
         ~s(#{format_attr_name(attr_name)}="#{attr_value}")
       end)
    |> Enum.join(" ")
  end

  defp format_attr_name(attr_name) do
    "#{attr_name}" |> String.replace("_", "-")
  end
end
