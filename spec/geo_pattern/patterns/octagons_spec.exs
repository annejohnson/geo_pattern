defmodule GeoPattern.Patterns.OctagonsSpec do
  use ESpec, async: true
  doctest GeoPattern.Patterns.Octagons
  alias GeoPattern.Patterns.SharedPatternSpec

  before do
    {
      :ok,
      module: described_module,
      input_string: "hello",
      expected_width: 260,
      expected_height: 260,
      expected_svg_string: ~s[<polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,0.0)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,43.3)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,86.6)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,129.89999999999998)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,173.2)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,216.5)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" transform="translate(0.0,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(43.3,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(86.6,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(129.89999999999998,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(173.2,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(216.5,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(259.79999999999995,259.79999999999995)" points="14.3,0.0,29.0,0.0,43.3,14.3,43.3,29.0,29.0,43.3,14.3,43.3,0.0,29.0,0.0,14.3,14.3,0.0" />]
    }
  end

  include_examples(SharedPatternSpec)
end