defmodule GeoPattern.UtilsSpec do
  use ESpec
  doctest GeoPattern.Utils

  describe "remap/5" do
    context "when the current range and new range are the same length" do
      let :value, do: 8
      let :value_min, do: 0
      let :value_max, do: 15
      let :new_min, do: 15
      let :new_max, do: 30
      let :expected_new_value, do: 23

      it "maps the value into the new range" do
        expect(
          described_module.remap(value, value_min, value_max, new_min, new_max)
        )
        |> to(eq expected_new_value)
      end
    end

    context "when the new range is larger than the current range" do
      let :value, do: 3
      let :value_min, do: 0
      let :value_max, do: 4
      let :new_min, do: 0
      let :new_max, do: 100
      let :expected_new_value, do: 75

      it "maps the value into the new range" do
        expect(
          described_module.remap(value, value_min, value_max, new_min, new_max)
        )
        |> to(eq expected_new_value)
      end
    end
  end
end
