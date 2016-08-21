# GeoPattern [![Hex.pm](https://img.shields.io/hexpm/v/geo_pattern.svg?style=flat-square)](https://hex.pm/packages/geo_pattern) [![Travis](https://img.shields.io/travis/annejohnson/geo_pattern.svg?style=flat-square)](https://travis-ci.org/annejohnson/geo_pattern)

This is an Elixir port of the [Ruby GeoPattern library by Jason Long](https://github.com/jasonlong/geo_pattern). It converts strings into beautiful SVG patterns that can be used as the background-image of containers. See example patterns generated by the Ruby library in [Github Guides](https://guides.github.com/), and view the Javascript port in action in the [live preview tool by Brandon Mills](http://btmills.github.io/geopattern/geopattern.html). In this port, 16 different patterns are available, and the pattern and the background color are configurable.

## Installation

Add geo_pattern to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:geo_pattern, "~> 0.0.1"}]
end
```

## Usage Instructions

Use <code>GeoPattern.generate/1</code> to get a complete NodeCollection. If you want a string, pass the result to <code>to_string/1</code>.

```elixir
iex> GeoPattern.generate("Hello, world")
%GeoPattern.SVG.NodeCollection{
  nodes: [
    %GeoPattern.SVG.Node{attrs: [xmlns: "http://www.w3.org/2000[204/1987]
      width: 227.10000000000002, height: 393.34873839889207], closing: false,
      name: "svg", self_closing: false},
    %GeoPattern.SVG.Node{attrs: [fill: "#843C90", x: 0, y: 0, width: "100%",
      height: "100%"], closing: false, name: "rect", self_closing: true},
    ..
  ]
}

iex> GeoPattern.generate("Hello, world") |> to_string
"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"227.10000000000002\" height=\"393.34873839889207\"><rect fill=\"#843C90\" x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" /><polyline fill=\"#DDD\" fill-opacity=\"0.1\" stroke=\"#000\" stroke-opacity=\"0.02\" transform=\"translate(-37.85,0.0) rotate(180,37.85,32.779061533241006)\" points=\"37.85,0,75.7,65.55812306648201,0,65.55812306648201,37.85,0\" /><polyline fill=\"#DDD\" fill-opacity=\"0.1\" stroke=\"#000\" stroke-opacity=\"0.02\" transform=\"translate(189.25,0.0) rotate(180,37.85,32.779061533241006)\" points=\"37.85,0,75.7,65.55812306648201,0,65.55812306648201,37.85,0\" />.."
```

To write a pattern to a file, use <code>GeoPattern.generate_to_file/2</code>.

```elixir
iex> GeoPattern.generate_to_file("patterns!", "my-pattern.svg")
:ok
```

You can specify :color and :pattern options in <code>GeoPattern.generate/2</code> and <code>GeoPattern.generate_to_file/3</code>. The :color option sets the background color.

```elixir
iex> GeoPattern.generate("dragons", color: "#445588")
%GeoPattern.SVG.NodeCollection{..}

iex> GeoPattern.generate_to_file("fairies", "background.svg", pattern: :concentric_circles)
:ok
```

### Available Patterns

TODO.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/annejohnson/geo_pattern. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Get started by cloning the [repository](https://github.com/annejohnson/geo_pattern), running <code>mix deps.get</code>, and running the test suite with <code>mix espec</code>.
