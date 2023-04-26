defmodule FranklinImporter.ArticleLoaderTest do
  use ExUnit.Case

  alias FranklinImporter.ArticleLoader

  test "loads expected articles" do
    result = ArticleLoader.load_articles()
    dbg(result)
  end
end
