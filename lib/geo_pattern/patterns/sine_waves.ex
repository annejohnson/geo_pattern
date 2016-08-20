defmodule GeoPattern.Patterns.SineWaves do
  use GeoPattern.Patterns.Shared

  @min_period 100
  @max_period 400
  @min_amplitude 30
  @max_amplitude 100
  @min_wave_width 3
  @max_wave_width 30

  def pattern_nodes(input_string) do
    0..35
    |> Enum.map(&make_pattern_unit(&1, input_string))
    |> NodeCollection.new
  end

  def make_pattern_unit(i, input_string) do
    hex_int = Utils.hex_int(input_string, i, 1)

    prd = period(input_string)
    w_width = wave_width(input_string)
    amp = amplitude(input_string)
    x_offset = prd / 4 * 0.7

    styles = [
      fill: 'none',
      stroke: Utils.fill_color(hex_int),
      style: %{
        opacity: Utils.opacity(hex_int),
        stroke_width: "#{w_width}px"
      }
    ]

    str =
      "M0 " <>
      to_string(amp) <>
      " C " <>
      to_string(x_offset) <>
      " 0, " <>
      to_string(prd / 2 - x_offset) <>
      " 0, " <>
      to_string(prd / 2) <>
      " " <>
      to_string(amp) <>
      " S " <>
      to_string(prd - x_offset) <>
      " " <>
      to_string(amp * 2) <>
      ", " <>
      to_string(prd) <>
      " " <>
      to_string(amp) <>
      " S " <>
      to_string(prd * 1.5 - x_offset) <>
      " 0, " <>
      to_string(prd * 1.5) <>
      ", " <>
      to_string(amp)

    [
      Node.path(
        str,
        Keyword.merge(styles, [
          transform: "translate(-#{prd / 4}, #{w_width * i - amp * 1.5})"
        ])
      ),
      Node.path(
        str,
        Keyword.merge(styles, [
          transform: "translate(-#{prd / 4}, #{w_width * i - amp * 1.5 + w_width * 36})"
        ])
      )
    ]
  end

  def period(input_string) do
    input_string
    |> Utils.hex_int(0, 1)
    |> Utils.hex_remap(@min_period, @max_period)
  end

  def amplitude(input_string) do
    input_string
    |> Utils.hex_int(1, 1)
    |> Utils.hex_remap(@min_amplitude, @max_amplitude)
  end

  def wave_width(input_string) do
    input_string
    |> Utils.hex_int(2, 1)
    |> Utils.hex_remap(@min_wave_width, @max_wave_width)
  end

  def width(input_string) do
    period(input_string)
  end

  def height(input_string) do
    wave_width(input_string) * 36
  end
end
