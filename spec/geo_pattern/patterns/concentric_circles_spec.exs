defmodule GeoPattern.Patterns.ConcentricCirclesSpec do
  use ESpec
  doctest GeoPattern.Patterns.ConcentricCircles
  alias GeoPattern.Patterns.SharedPatternSpec

  before do
    {
      :ok,
      module: described_module,
      input_string: "hello",
      expected_width: 312,
      expected_height: 312,
      expected_svg_string: ~s(<circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="25.979999999999997" cy="25.979999999999997" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="25.979999999999997" cy="25.979999999999997" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="77.94" cy="25.979999999999997" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="77.94" cy="25.979999999999997" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.2;stroke-width:8.66px;" cx="129.89999999999998" cy="25.979999999999997" r="21.65" /><circle fill="#222" fill-opacity="0.0" cx="129.89999999999998" cy="25.979999999999997" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="181.85999999999999" cy="25.979999999999997" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="181.85999999999999" cy="25.979999999999997" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="233.81999999999996" cy="25.979999999999997" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="233.81999999999996" cy="25.979999999999997" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="285.78" cy="25.979999999999997" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="285.78" cy="25.979999999999997" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.0;stroke-width:8.66px;" cx="25.979999999999997" cy="77.94" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="25.979999999999997" cy="77.94" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="77.94" cy="77.94" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="77.94" cy="77.94" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="129.89999999999998" cy="77.94" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="129.89999999999998" cy="77.94" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="181.85999999999999" cy="77.94" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="181.85999999999999" cy="77.94" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="233.81999999999996" cy="77.94" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="233.81999999999996" cy="77.94" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="285.78" cy="77.94" r="21.65" /><circle fill="#DDD" fill-opacity="0.0" cx="285.78" cy="77.94" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="25.979999999999997" cy="129.89999999999998" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="25.979999999999997" cy="129.89999999999998" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="77.94" cy="129.89999999999998" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="77.94" cy="129.89999999999998" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="129.89999999999998" cy="129.89999999999998" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="129.89999999999998" cy="129.89999999999998" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:8.66px;" cx="181.85999999999999" cy="129.89999999999998" r="21.65" /><circle fill="#222" fill-opacity="0.0" cx="181.85999999999999" cy="129.89999999999998" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="233.81999999999996" cy="129.89999999999998" r="21.65" /><circle fill="#222" fill-opacity="0.2" cx="233.81999999999996" cy="129.89999999999998" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="285.78" cy="129.89999999999998" r="21.65" /><circle fill="#DDD" fill-opacity="0.0" cx="285.78" cy="129.89999999999998" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="25.979999999999997" cy="181.85999999999999" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="25.979999999999997" cy="181.85999999999999" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="77.94" cy="181.85999999999999" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="77.94" cy="181.85999999999999" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="129.89999999999998" cy="181.85999999999999" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="129.89999999999998" cy="181.85999999999999" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="181.85999999999999" cy="181.85999999999999" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="181.85999999999999" cy="181.85999999999999" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:8.66px;" cx="233.81999999999996" cy="181.85999999999999" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="233.81999999999996" cy="181.85999999999999" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.2;stroke-width:8.66px;" cx="285.78" cy="181.85999999999999" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="285.78" cy="181.85999999999999" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.0;stroke-width:8.66px;" cx="25.979999999999997" cy="233.81999999999996" r="21.65" /><circle fill="#DDD" fill-opacity="0.0" cx="25.979999999999997" cy="233.81999999999996" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="77.94" cy="233.81999999999996" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="77.94" cy="233.81999999999996" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="129.89999999999998" cy="233.81999999999996" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="129.89999999999998" cy="233.81999999999996" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="181.85999999999999" cy="233.81999999999996" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="181.85999999999999" cy="233.81999999999996" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.0;stroke-width:8.66px;" cx="233.81999999999996" cy="233.81999999999996" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="233.81999999999996" cy="233.81999999999996" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="285.78" cy="233.81999999999996" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="285.78" cy="233.81999999999996" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="25.979999999999997" cy="285.78" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="25.979999999999997" cy="285.78" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="77.94" cy="285.78" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="77.94" cy="285.78" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="129.89999999999998" cy="285.78" r="21.65" /><circle fill="#222" fill-opacity="0.1" cx="129.89999999999998" cy="285.78" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="181.85999999999999" cy="285.78" r="21.65" /><circle fill="#222" fill-opacity="0.0" cx="181.85999999999999" cy="285.78" r="10.825" /><circle fill="none" stroke="#DDD" style="opacity:0.1;stroke-width:8.66px;" cx="233.81999999999996" cy="285.78" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="233.81999999999996" cy="285.78" r="10.825" /><circle fill="none" stroke="#222" style="opacity:0.1;stroke-width:8.66px;" cx="285.78" cy="285.78" r="21.65" /><circle fill="#DDD" fill-opacity="0.1" cx="285.78" cy="285.78" r="10.825" />)
    }
  end

  include_examples(SharedPatternSpec)
end
