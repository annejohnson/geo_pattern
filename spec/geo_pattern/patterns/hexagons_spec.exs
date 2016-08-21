defmodule GeoPattern.Patterns.HexagonsSpec do
  use ESpec, async: true
  doctest GeoPattern.Patterns.Hexagons
  alias GeoPattern.Patterns.SharedPatternSpec

  before do
    {
      :ok,
      module: described_module,
      input_string: "hello",
      expected_width: 384,
      expected_height: 443,
      expected_svg_string: ~s[<polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,-36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,-36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,406.7721321575508)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,406.7721321575508)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,0.0)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,443.7514168991463)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,-36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,406.7721321575508)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,0.0)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,443.7514168991463)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,-36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,406.7721321575508)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,0.0)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,443.7514168991463)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,73.95856948319104)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,73.95856948319104)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,36.97928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,73.95856948319104)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,110.93785422478658)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,110.93785422478658)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,147.9171389663821)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,110.93785422478658)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,147.9171389663821)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,110.93785422478658)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,147.9171389663821)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,184.89642370797762)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,184.89642370797762)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,221.87570844957312)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,184.89642370797762)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,221.87570844957312)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,184.89642370797762)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.2" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,221.87570844957312)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,258.8549931911687)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,258.8549931911687)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,295.8342779327642)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,258.8549931911687)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,295.8342779327642)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.0" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,258.8549931911687)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,295.8342779327642)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(-42.7,332.8135626743598)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(341.6000000000001,332.8135626743598)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(21.35000000000001,369.7928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(85.40000000000002,332.8135626743598)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(149.45000000000005,369.7928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#DDD" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(213.50000000000006,332.8135626743598)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" /><polyline fill="#222" fill-opacity="0.1" stroke="#000" stroke-opacity="0.02" transform="translate(277.55,369.7928474159553)" points="0,36.97928474159553,21.35,0,64.05000000000001,0,85.4,36.97928474159553,64.05000000000001,73.95856948319106,21.35,73.95856948319106,0,36.97928474159553" />]
    }
  end

  include_examples(SharedPatternSpec)
end
