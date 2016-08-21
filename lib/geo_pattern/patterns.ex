defmodule GeoPattern.Patterns do
  @moduledoc """
  Contains functions for listing the available pattern atoms and modules.
  """

  @doc """
  Returns a tuple of available pattern atoms.

  ## Example

      iex> GeoPattern.Patterns.pattern_atoms
      {
        :chevrons,
        :concentric_circles,
        :diamonds,
        :hexagons,
        :mosaic_squares,
        :nested_squares,
        :octagons,
        :overlapping_circles,
        :overlapping_rings,
        :plaid,
        :plus_signs,
        :sine_waves,
        :squares,
        :tessellation,
        :triangles,
        :xes
      }
  """
  def pattern_atoms do
    {
      :chevrons,
      :concentric_circles,
      :diamonds,
      :hexagons,
      :mosaic_squares,
      :nested_squares,
      :octagons,
      :overlapping_circles,
      :overlapping_rings,
      :plaid,
      :plus_signs,
      :sine_waves,
      :squares,
      :tessellation,
      :triangles,
      :xes
    }
  end

  @doc """
  Returns a list of available pattern modules.
  """
  def pattern_modules do
    pattern_atoms
    |> Tuple.to_list
    |> Enum.map(&pattern_atom_to_module/1)
  end

  @doc """
  Given a valid pattern atom, returns the corresponding pattern module.

  ## Parameters

    - `atom` (Atom) example: `:concentric_circles`.

  ## Example

      iex> GeoPattern.Patterns.pattern_atom_to_module(:sine_waves)
      GeoPattern.Patterns.SineWaves
  """
  def pattern_atom_to_module(atom) do
    unless Enum.member?(Tuple.to_list(pattern_atoms), atom) do
      raise ArgumentError,
            message: "Invalid pattern: :#{atom}. Call #{__MODULE__}.pattern_atoms/0 to see available patterns."
    end

    module_string = atom
                    |> to_string
                    |> GeoPattern.Utils.snake_case_to_module_case
    :"Elixir.GeoPattern.Patterns.#{module_string}"
  end
end
