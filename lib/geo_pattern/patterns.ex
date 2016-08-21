defmodule GeoPattern.Patterns do
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

  def pattern_modules do
    pattern_atoms
    |> Tuple.to_list
    |> Enum.map(&pattern_atom_to_module/1)
  end

  def pattern_atom_to_module(atom) do
    module_string = atom
                    |> to_string
                    |> GeoPattern.Utils.snake_case_to_module_case
    :"Elixir.GeoPattern.Patterns.#{module_string}"
  end
end
