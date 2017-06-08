defmodule ElMonads.Mixfile do
  use Mix.Project

  def project do
    [app: :monads,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     name: "El Monads",
     source_url: "https://github.com/Twizty/el_monads",
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  def description do
    "This is an implementation of the `Try` and `Maybe` monads. Please see tests for examples."
  end

  defp package do
    # These are the default files included in the package
    [
      name: :el_monads,
      files: ["lib", "mix.exs", "README*", "LICENSE*", "config"],
      maintainers: ["Maxim Davydov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Twizty/el_monads"}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.14", only: :dev, runtime: false}]
  end
end
