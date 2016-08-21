defmodule GeoPattern do
  def generate(input_string, options \\ []) do
    pattern_module(
      input_string,
      options
    ).generate(
      input_string,
      options
    )
  end

  def generate_to_file(input_string, filename, options \\ []) do
    {:ok, file} = File.open(filename, [:write])
    svg_string = input_string
                 |> generate(options)
                 |> to_string

    IO.binwrite(file, svg_string)
    File.close(file)
  end

  defp pattern_module(input_string, options) do
    pattern_atom = options[:pattern] ||
                   GeoPattern.Utils.pattern_atom(input_string)
    GeoPattern.Patterns.pattern_atom_to_module(pattern_atom)
  end
end
