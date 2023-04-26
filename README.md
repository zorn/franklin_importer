# FranklinImporter

This is a support project for [Franklin](https://github.com/zorn/franklin), my custom LiveView blog website.

The purpose of FranklinImporter is an isolated script I can run to import old content from a folder of markdown files and assets into the needed structure of Franklin.

Franklin has a GraphQL API I can use to create articles, request media upload URLs, and so on. This script will process a folder of local content folder and use said API to insert all the old content into Franklin.

The content folder itself will not be added to this repo since it's already in the [mikezornek.com](https://github.com/zorn/mikezornek.com) repo. Since (for me) those repos live in local folders next to each other, the script will assume those paths and jump up and into `mikezornek.com` to get the content.
