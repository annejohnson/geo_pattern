defmodule GeoPattern.PatternsSpec do
  use ESpec, async: true
  doctest GeoPattern.Patterns

  describe "pattern_atom_to_module/1" do
    it "converts a pattern atom into a module reference" do
      expect(
        described_module.pattern_atom_to_module(:concentric_circles)
      )
      |> to(eq GeoPattern.Patterns.ConcentricCircles)
    end
  end
end
