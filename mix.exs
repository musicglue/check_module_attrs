defmodule CheckModuleAttrs.MixProject do
  use Mix.Project

  def project do
    [
      app: :check_module_attrs,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: false,
      description: description(),
      deps: deps(),
      package: package(),
      name: "CheckModuleAttrs",
      source_url: "https://github.com/musicglue/check_module_attrs"
    ]
  end

  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/musicglue/check_module_attrs"}
    ]
  end

  defp description() do
    "This library provided mix task `check_module_attrs` which will check for module attributes being set to values from `config/releases.exs`. This will fail in production and must be avoided."
  end
end
