defmodule GeoPattern.Patterns.NestedSquaresSpec do
  use ESpec, async: true
  doctest GeoPattern.Patterns.NestedSquares
  alias GeoPattern.Patterns.SharedPatternSpec

  before do
    {
      :ok,
      module: described_module,
      input_string: "hello",
      expected_width: 502,
      expected_height: 502,
      expected_svg_string: ~s[<rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="4.65" y="4.65" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="23.25" y="23.25" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="88.35000000000002" y="4.65" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="106.95000000000002" y="23.25" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.2;stroke-width:9.3;" x="172.05000000000004" y="4.65" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.0;stroke-width:9.3;" x="190.65000000000003" y="23.25" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="255.75000000000006" y="4.65" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="274.35" y="23.25" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="339.45000000000005" y="4.65" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="358.05000000000007" y="23.25" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="423.1500000000001" y="4.65" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="441.7500000000001" y="23.25" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.0;stroke-width:9.3;" x="4.65" y="88.35000000000002" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="23.25" y="106.95000000000002" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="88.35000000000002" y="88.35000000000002" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="106.95000000000002" y="106.95000000000002" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="172.05000000000004" y="88.35000000000002" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="190.65000000000003" y="106.95000000000002" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="255.75000000000006" y="88.35000000000002" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="274.35" y="106.95000000000002" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="339.45000000000005" y="88.35000000000002" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="358.05000000000007" y="106.95000000000002" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="423.1500000000001" y="88.35000000000002" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:9.3;" x="441.7500000000001" y="106.95000000000002" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="4.65" y="172.05000000000004" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="23.25" y="190.65000000000003" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="88.35000000000002" y="172.05000000000004" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="106.95000000000002" y="190.65000000000003" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="172.05000000000004" y="172.05000000000004" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="190.65000000000003" y="190.65000000000003" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:9.3;" x="255.75000000000006" y="172.05000000000004" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.0;stroke-width:9.3;" x="274.35" y="190.65000000000003" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="339.45000000000005" y="172.05000000000004" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.2;stroke-width:9.3;" x="358.05000000000007" y="190.65000000000003" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="423.1500000000001" y="172.05000000000004" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:9.3;" x="441.7500000000001" y="190.65000000000003" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="4.65" y="255.75000000000006" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="23.25" y="274.35" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="88.35000000000002" y="255.75000000000006" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="106.95000000000002" y="274.35" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="172.05000000000004" y="255.75000000000006" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="190.65000000000003" y="274.35" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="255.75000000000006" y="255.75000000000006" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="274.35" y="274.35" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:9.3;" x="339.45000000000005" y="255.75000000000006" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="358.05000000000007" y="274.35" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.2;stroke-width:9.3;" x="423.1500000000001" y="255.75000000000006" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="441.7500000000001" y="274.35" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.0;stroke-width:9.3;" x="4.65" y="339.45000000000005" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:9.3;" x="23.25" y="358.05000000000007" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="88.35000000000002" y="339.45000000000005" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="106.95000000000002" y="358.05000000000007" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="172.05000000000004" y="339.45000000000005" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="190.65000000000003" y="358.05000000000007" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="255.75000000000006" y="339.45000000000005" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="274.35" y="358.05000000000007" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:9.3;" x="339.45000000000005" y="339.45000000000005" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="358.05000000000007" y="358.05000000000007" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="423.1500000000001" y="339.45000000000005" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="441.7500000000001" y="358.05000000000007" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="4.65" y="423.1500000000001" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="23.25" y="441.7500000000001" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="88.35000000000002" y="423.1500000000001" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="106.95000000000002" y="441.7500000000001" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="172.05000000000004" y="423.1500000000001" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="190.65000000000003" y="441.7500000000001" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="255.75000000000006" y="423.1500000000001" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#222" style="opacity:0.0;stroke-width:9.3;" x="274.35" y="441.7500000000001" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="339.45000000000005" y="423.1500000000001" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="358.05000000000007" y="441.7500000000001" width="27.900000000000002" height="27.900000000000002" /><rect fill="none" stroke="#222" style="opacity:0.1;stroke-width:9.3;" x="423.1500000000001" y="423.1500000000001" width="65.10000000000001" height="65.10000000000001" /><rect fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:9.3;" x="441.7500000000001" y="441.7500000000001" width="27.900000000000002" height="27.900000000000002" />]
    }
  end

  include_examples(SharedPatternSpec)
end