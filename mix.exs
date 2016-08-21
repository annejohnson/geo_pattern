defmodule GeoPattern.Mixfile do
  use Mix.Project

  def project do
    [app: :geo_pattern,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [espec: :test],
     description: description,
     deps: deps,
     package: package]
  end

  def application do
    [applications: [:logger]]
  end

  defp description do
    "An Elixir library for generating beautiful SVG patterns from strings."
  end

  defp deps do
    [{:espec, "~> 0.8.21", only: :test},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp package do
    [licenses: ["MIT"],
     maintainers: ["annecodes@gmail.com"],
     links: %{"GitHub" => "https://github.com/annejohnson/geo_pattern"}]
  end
end
