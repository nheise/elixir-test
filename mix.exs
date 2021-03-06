defmodule Sandbox.MixProject do
  use Mix.Project

  def project do
    [
      app: :sandbox,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {MyEctoTest.App, []},
      #mod: {GenStageMaschine.Application,[]},
      extra_applications: [:logger, :postgrex, :ecto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:gen_state_machine, "~> 2.0"},
      #{:gen_stage, "~> 0.14.1"}, it's in flow
      {:flow, "~> 0.14.3"},
      {:phoenix_pubsub, "~> 1.1"},
      {:ecto, "~> 3.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
    ]
  end
end
