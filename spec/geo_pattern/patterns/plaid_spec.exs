defmodule GeoPattern.Patterns.PlaidSpec do
  use ESpec, async: true
  doctest GeoPattern.Patterns.Plaid
  alias GeoPattern.Patterns.SharedPatternSpec

  before do
    {
      :ok,
      module: described_module,
      input_string: "hello",
      expected_width: 522,
      expected_height: 522,
      expected_svg_string: ~s[<rect opacity="0.1" fill="#DDD" x="0" y="15" width="100%" height="15" /><rect opacity="0.1" fill="#DDD" x="0" y="50" width="100%" height="9" /><rect opacity="0.1" fill="#DDD" x="0" y="76" width="100%" height="11" /><rect opacity="0.1" fill="#222" x="0" y="93" width="100%" height="18" /><rect opacity="0.1" fill="#DDD" x="0" y="129" width="100%" height="17" /><rect opacity="0.1" fill="#222" x="0" y="163" width="100%" height="10" /><rect opacity="0.1" fill="#DDD" x="0" y="192" width="100%" height="13" /><rect opacity="0.0" fill="#DDD" x="0" y="220" width="100%" height="7" /><rect opacity="0.1" fill="#DDD" x="0" y="245" width="100%" height="15" /><rect opacity="0.1" fill="#DDD" x="0" y="276" width="100%" height="19" /><rect opacity="0.1" fill="#DDD" x="0" y="313" width="100%" height="19" /><rect opacity="0.2" fill="#222" x="0" y="337" width="100%" height="20" /><rect opacity="0.1" fill="#222" x="0" y="365" width="100%" height="16" /><rect opacity="0.1" fill="#DDD" x="0" y="390" width="100%" height="13" /><rect opacity="0.1" fill="#DDD" x="0" y="410" width="100%" height="17" /><rect opacity="0.1" fill="#222" x="0" y="445" width="100%" height="14" /><rect opacity="0.1" fill="#DDD" x="0" y="474" width="100%" height="19" /><rect opacity="0.1" fill="#222" x="0" y="508" width="100%" height="14" /><rect opacity="0.1" fill="#DDD" x="15" y="0" width="15" height="100%" /><rect opacity="0.1" fill="#DDD" x="50" y="0" width="9" height="100%" /><rect opacity="0.1" fill="#DDD" x="76" y="0" width="11" height="100%" /><rect opacity="0.1" fill="#222" x="93" y="0" width="18" height="100%" /><rect opacity="0.1" fill="#DDD" x="129" y="0" width="17" height="100%" /><rect opacity="0.1" fill="#222" x="163" y="0" width="10" height="100%" /><rect opacity="0.1" fill="#DDD" x="192" y="0" width="13" height="100%" /><rect opacity="0.0" fill="#DDD" x="220" y="0" width="7" height="100%" /><rect opacity="0.1" fill="#DDD" x="245" y="0" width="15" height="100%" /><rect opacity="0.1" fill="#DDD" x="276" y="0" width="19" height="100%" /><rect opacity="0.1" fill="#DDD" x="313" y="0" width="19" height="100%" /><rect opacity="0.2" fill="#222" x="337" y="0" width="20" height="100%" /><rect opacity="0.1" fill="#222" x="365" y="0" width="16" height="100%" /><rect opacity="0.1" fill="#DDD" x="390" y="0" width="13" height="100%" /><rect opacity="0.1" fill="#DDD" x="410" y="0" width="17" height="100%" /><rect opacity="0.1" fill="#222" x="445" y="0" width="14" height="100%" /><rect opacity="0.1" fill="#DDD" x="474" y="0" width="19" height="100%" /><rect opacity="0.1" fill="#222" x="508" y="0" width="14" height="100%" />]
    }
  end

  include_examples(SharedPatternSpec)
end
