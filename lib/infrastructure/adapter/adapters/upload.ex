defmodule Server.Adapter.Upload do
  def buildInput(args) do
    body = args.body_params
    body
    |>(fn(body) ->
      file = get_in(body, ["file"])
      file
    end).()
  end
  def handle(command) do
    fn (args) -> command.execute(buildInput(args)) end
  end
end
