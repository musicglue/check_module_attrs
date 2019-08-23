# CheckModuleAttrs

This library provided mix task `check_module_attrs` which will check for module attributes being set to values from `config/releases.exs`. This will fail in production and must be avoided.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `check_module_attrs` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:check_module_attrs, "~> 0.1.0"}
  ]
end
```

Usage:
```
$ mix check_module_attrs
```

This tasks should be also run on CI - it will exit code 0, if everything is correct and 1 otherwise.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/check_module_attrs](https://hexdocs.pm/check_module_attrs).

