defmodule SVGNode do
  defstruct name: "svg", self_closing: false, closing: false, attrs: []

  def to_string(%SVGNode{name: name, self_closing: self_closing, closing: closing, attrs: attrs}) do
    prefix = if closing, do: "</", else: "<"
    suffix = if self_closing, do: " />", else: ">"

    middle = [name, attr_string(attrs)]
             |> Enum.filter(&String.first/1)
             |> Enum.join(" ")
    prefix <> middle <> suffix
  end

  def attr_string(attrs) when is_list(attrs) do
    attrs
    |> Enum.map(fn({attr_name, attr_value}) ->
         ~s(#{attr_name}="#{attr_value}")
       end)
    |> Enum.join(" ")
  end
end
