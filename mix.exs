defmodule Percebex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :percebex,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison, :sweet_xml]
    ]
  end

  defp elixirc_paths(_), do: ["lib", "web", "test/backends"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:sweet_xml, "~> 0.6"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false}
    ]
  end
end
