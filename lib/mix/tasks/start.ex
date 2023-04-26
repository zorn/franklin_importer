defmodule Mix.Tasks.Start do
  @moduledoc """
  A Mix task to start the import process.
  """

  use Mix.Task

  alias FranklinImporter.ArticleLoader

  @shortdoc "Starts the import process."
  def run(_command_line_args) do
    # This will start our application
    Mix.Task.run("app.start")

    ArticleLoader.load_articles()
  end
end
