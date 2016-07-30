defmodule GeoPattern.UtilsSpec do
  use ESpec
  doctest GeoPattern.Utils

  let :input_string, do: "Hello, world"

  describe "hex_int/2" do
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

  describe "opacity/1" do
    context "when passed numbers between 0 and 15 (hex integers)" do
      it "returns floats between 0 and 1.0" do
        Enum.each(
          0..15,
          fn(hex_int) ->
            expect described_module.opacity(hex_int)
            |> to(be_between 0, 1.0)
          end
        )
      end
    end
  end

  describe "stroke_opacity/0" do
    it "returns a float between 0 and 1.0" do
      expect described_module.stroke_opacity
      |> to(be_between 0, 1.0)
    end
  end

  describe "stroke_color/0" do
    it "returns a hex color string" do
      expect described_module.stroke_color
      |> to(match shared.hex_color_regex)
    end
  end

  describe "fill_color/1" do
    context "when passed numbers between 0 and 15 (hex integers)" do
      it "returns hex color strings" do
        Enum.each(
          0..15,
          fn(hex_int) ->
            expect described_module.fill_color(hex_int)
            |> to(match shared.hex_color_regex)
          end
        )
      end
    end
  end

  describe "transform_color/2" do
    it "transforms one RGB color into another" do
      old_color_string = "#6622aa"
      old_color = GeoPattern.Color.RGB.new(old_color_string)
      new_color =
        described_module.transform_color(input_string, old_color)

      expect to_string(new_color)
      |> not_to(eq old_color_string)
    end
  end

  describe "background_color_string/1" do
    it "gets a hex color string based on the input string" do
      expect described_module.background_color_string(input_string)
      |> to(match shared.hex_color_regex)
    end
  end
end
