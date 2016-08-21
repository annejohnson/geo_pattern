defmodule GeoPattern do
  @moduledoc """
  Contains functions for generating patterns based on an input string.
  """

  @doc """
  Generates a pattern from the input string. Returns the pattern as structured
  SVG node data that can be passed to `to_string/1`.

  ## Parameters

    - `input_string` (String)
    - `options` (Keyword list)
      - `color`: (String) color to use for the background, if not the color
        generated from the input string. Example: "#222aa4".
      - `pattern`: (Atom) pattern to use, if not the one chosen based on the
        input string. Example: `:concentric_circles`. See
        `GeoPattern.Patterns.pattern_atoms/0` for all available patterns.

  ## Example

      iex> GeoPattern.generate("Hello, world", pattern: :nested_squares)
  """
  def generate(input_string, options \\ []) do
    pattern_module(
      input_string,
      options
    ).generate(
      input_string,
      options
    )
  end

  @doc """
  Generates a pattern from the input string and writes it to the specified file. Returns `:ok`.

  ## Parameters

    - `input_string` (String)
    - `file_name` (String) example: "my-pattern.svg".
    - `options` (Keyword list)
      - `color`: (String) color to use for the background, if not the color
        generated from the input string. Example: "#222aa4".
      - `pattern`: (Atom) pattern to use, if not the one chosen based on the
        input string. Example: `:concentric_circles`. See
        `GeoPattern.Patterns.pattern_atoms/0` for all available patterns.

  ## Example

      iex> GeoPattern.generate_to_file("Once upon a time...", "pattern.svg", color: "#bcff99")
  """
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
