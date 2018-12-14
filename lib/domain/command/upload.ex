defmodule Server.Command.Upload do

  def download(url) do
    IO.inspect url
    (fn ->
      case Download.from(url, [path: "./lib/cloud/services/serverless/code.zip"]) do
        {:ok, path} -> %{status: 200, file: "Uploaded.", path: path}
        {:error, reason} -> %{status: 400, body: %{error: "Problem with uploaded file, please check the url.", reason: reason}}
      end
    end).()
  end
  def execute(args) do
    (fn ->
      case args do
        nil -> %{status: 400, body: %{reason: "File was not sent."}}
        _ -> download(args)
      end
    end).()
  end
end
