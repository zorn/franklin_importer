defmodule FranklinImporter.ArticleLoader do
  def load_articles() do
    # add ignore .DS_Store and others.

    content_dir = Path.join([File.cwd!(), "../mikezornek/content/posts"])
    walk(content_dir)

    # get a list of all known media files from the content folder
    # create a data structure to store the meta data for each, things like expected url, filename, etc.
    # for each media items upload it to the franklin media bucker via upload urls
    # store the outcomes of this for later

    # get a list of post markdown files in the content directory
    # map each file path into a post struct
    # for each post struct, inspect the body for media items and swap in the new urls
    # for each post struct, use the graph api to create an article.
  end

  def walk(folder_path) do
    walk_files(folder_path, [])
  end

  defp walk_files(folder_path, acc) do
    case File.ls(folder_path) do
      {:ok, paths} ->
        dbg(paths)

        Enum.reduce(paths, acc, fn path, acc ->
          path = Path.expand(path)

          if File.dir?(path) do
            dbg("is a directory")
            walk_files(path, acc)
          else
            dbg(path)
            dbg("is not a directory")

            if Path.extname(path) == ".md" do
              [path | acc]
            else
              acc
            end
          end
        end)

      {:error, reason} ->
        dbg(reason)
        acc
    end
  end
end
