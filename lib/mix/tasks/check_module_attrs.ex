defmodule Mix.Tasks.CheckModuleAttrs do
  use Mix.Task

  @shortdoc "Check project for wrongly added module attributes from config/releases.exs."
  def run(_) do
    file = File.read!(Path.join("config", "releases.exs"))

    file
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(fn x -> !(x |> String.starts_with?("config")) end)
    |> Enum.map(fn x -> x |> String.replace("config ", "") end)
    |> Enum.map(fn x -> x |> String.split(", ") |> Enum.reverse() |> tl() |> Enum.reverse() end)
    |> Enum.map(fn x -> x |> Enum.join(", ") end)
    |> CheckModuleAttrs.pmap(fn x ->
      System.cmd("grep", [
        "-E",
        "@[a-zA-Z_0-9-]+ Application.get_env\\(#{x}\\)$",
        "-r",
        "lib/"
      ])
    end)
    |> Enum.reject(fn {x, _} -> x == "" end)
    |> Enum.map(fn {file, _} -> String.trim(file) end)
    |> handle_attrs()
  end

  defp handle_attrs([]), do: exit(:shutdown)

  defp handle_attrs(wrong_attrs) do
    IO.puts("Warning! Release config vars found in module attributes")
    IO.puts("That won't work: they are resolved only during compilation time")
    IO.puts("")
    IO.puts("Offending files:")

    Enum.map(wrong_attrs, fn file -> IO.puts(file) end)

    exit({:shutdown, 1})
  end
end
