defmodule GeoPattern.Patterns.PlusSignsSpec do
  use ESpec, async: true
  doctest GeoPattern.Patterns.PlusSigns
  alias GeoPattern.Patterns.SharedPatternSpec

  before do
    {
      :ok,
      module: described_module,
      input_string: "hello",
      expected_width: 240,
      expected_height: 240,
      expected_svg_string: ~s[<g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(-20.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(220.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(-20.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(220.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(20.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(20.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.2;" transform="translate(60.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.2;" transform="translate(60.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(100.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(100.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(140.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(140.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(180.0,-30.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(180.0,210.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(0.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(240.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(40.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(80.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(120.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(160.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(200.0,10.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(-20.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(220.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(20.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(60.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(100.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(140.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(180.0,50.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(0.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(240.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(40.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(80.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(120.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(160.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.2;" transform="translate(200.0,90.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(-20.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(220.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(20.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(60.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(100.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.0;" transform="translate(140.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(180.0,130.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(0.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(240.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(40.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(80.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(120.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#DDD" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(160.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g><g fill="#222" stroke="#000" stroke-opacity="0.02" style="fill-opacity:0.1;" transform="translate(200.0,170.0)"><rect x="20.0" y="0" width="20.0" height="60.0" /><rect x="0" y="20.0" width="60.0" height="20.0" /></g>]
    }
  end

  include_examples(SharedPatternSpec)
end
