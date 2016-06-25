defmodule SVG do
  def rect(x, y, width, height) do
    attrs = [x: x, y: y, width: width, height: height]
    elem_string("rect", Keyword.merge(attrs, [self_closing: true]))
  end

  def circle(cx, cy, r) do
    attrs = [cx: cx, cy: cy, r: r]
    elem_string("circle", Keyword.merge(attrs, [self_closing: true]))
  end

  def path(str) do
    elem_string("path", d: str, self_closing: true)
  end

  def polyline(str) do
    elem_string("polyline", points: str, self_closing: true)
  end

  def group(elems) do
    elem_string("g") <> Enum.join(elems, "") <> elem_string("g", closing: true)
  end

  def svg_header(width \\ 101, height \\ 101) do
    elem_string("svg", xmlns: "http://www.w3.org/2000/svg", width: width, height: height)
  end

  def svg_footer do
    elem_string("svg", closing: true)
  end

  def elem_string(elem_name, attrs \\ []) do
    self_closing = attrs |> Keyword.get(:self_closing, false)
    closing = attrs |> Keyword.get(:closing, false)
    attrs_to_write = attrs |> Keyword.drop([:closing, :self_closing])

    prefix = if closing, do: "</", else: "<"
    suffix = if self_closing, do: " />", else: ">"

    middle = [elem_name, attr_string(attrs_to_write)]
             |> Enum.filter(&String.first/1)
             |> Enum.join(" ")
    prefix <> middle <> suffix
  end

  def attr_string(attrs) do
    attrs
    |> Enum.map(fn({attr_name, attr_value}) ->
         ~s(#{attr_name}="#{attr_value}")
       end)
    |> Enum.join(" ")
  end
end
