defmodule FranklinImporter.ArticleLoader do
  @content_path Path.join([File.cwd!(), "../mikezornek/content/posts"])

  def load_articles() do
    # add ignore .DS_Store and others.

    @content_path
    |> markdown_files_from_path()

    # get a list of all known media files from the content folder
    # create a data structure to store the meta data for each, things like expected url, filename, etc.
    # for each media items upload it to the franklin media bucker via upload urls
    # store the outcomes of this for later

    # get a list of post markdown files in the content directory
    # map each file path into a post struct
    # for each post struct, inspect the body for media items and swap in the new urls
    # for each post struct, use the graph api to create an article.
  end

  defp markdown_files_from_path(path) do
    walk_path_for_markdown_files(path, [])
  end

  defp walk_path_for_markdown_files(incoming_path, acc) do
    # This function will recursively walk the incoming path,
    # adding all `.md` files to the accumulator.

    case File.ls(incoming_path) do
      {:ok, filenames} ->
        Enum.reduce(filenames, acc, fn filename, acc ->
          path = Path.join([incoming_path, filename])

          if File.dir?(path) do
            walk_path_for_markdown_files(path, acc)
          else
            if Path.extname(path) == ".md" do
              [path | acc]
            else
              acc
            end
          end
        end)

      {:error, reason} ->
        IO.inspect(reason, label: "Error from trying to list files.")
        acc
    end
  end
end
