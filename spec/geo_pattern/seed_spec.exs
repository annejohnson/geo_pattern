defmodule GeoPattern.SeedSpec do
  use ESpec, async: true
  doctest GeoPattern.Seed

  let :input_string, do: "Hello, world"

  describe "get_hexdigest/1" do
    it "gets a hexadecimal string for the specified input string" do
      expect described_module.get_hexdigest(input_string)
      |> to(match shared.hex_regex)
    end
  end

  describe "to_integer/2" do
    let :num_tests, do: 30

    it "returns integers between 0 and 15 (hex integers)" do
      Enum.each(
        1..num_tests,
        fn(i) ->
          result = described_module.to_integer(input_string, i)

          expect result
          |> to(be_between 0, 15)
        end
      )
    end
  end

  describe "to_integer/3" do
    let :num_tests, do: 30

    context "when passed a length of 2, signifying 2 hex digits" do
      it "returns integers between 0 and 255" do
        Enum.each(
          1..num_tests,
          fn(i) ->
            result = described_module.to_integer(input_string, i, 2)

            expect result
            |> to(be_between 0, 255)
          end
        )
      end
    end
  end

  describe "hex_color_string/0" do
    it "returns a hex color string" do
      expect described_module.hex_color_string
      |> to(match shared.hex_color_regex)
    end
  end
end
