defmodule Pagexduty.Mixfile do
  use Mix.Project

  def project do
    [app: :pagexduty,
     version: "0.1.0",
     elixir: "~> 1.0",
     description: description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison],
     mod: {Pagexduty, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options

  defp description do
    """
    A Pagerduty client for Elixir.
    """
  end

  defp deps do
    [{:httpoison, "~> 0.6"},
     {:exjsx, "~> 3.1.0", app: false},
     {:mock, "~> 0.1.1", only: :test}]
  end

  defp package do
    [ files: ["lib", "mix.exs", "README.md", "LICENSE"],
      contributors: ["Elba Sanchez, Guillermo Iguaran"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ride/pagexduty"} ]
  end
end
