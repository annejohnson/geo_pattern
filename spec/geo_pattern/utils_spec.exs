defmodule GeoPattern.UtilsSpec do
  use ESpec
  doctest GeoPattern.Utils

  describe "hex_int/2" do
    let :input_string, do: "Hello, world"
    let :num_tests, do: 30

    it "returns integers between 0 and 15 (hex integers)" do
      Enum.each(
        1..num_tests,
        fn(i) ->
          result = described_module.hex_int(input_string, i)
          expect result
          |> to(be_between 0, 15)
        end
      )
    end
  end

  describe "hex_int/3" do
    let :input_string, do: "Hello, world"
    let :num_tests, do: 30

    context "when passed a length of 2, signifying 2 hex digits" do
      it "returns integers between 0 and 255" do
        Enum.each(
          1..num_tests,
          fn(i) ->
            result = described_module.hex_int(input_string, i, 2)
            expect result
            |> to(be_between 0, 255)
          end
        )
      end
    end
  end

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
