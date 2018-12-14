defmodule Cloud.Adapter do
  def adapt(handler, command) do
    handler.handle(command.execute)
  end

  @spec success(any()) ::
          binary()
          | maybe_improper_list(
              binary() | maybe_improper_list(any(), binary() | []) | byte(),
              binary() | []
            )
  def success(data) do
    Poison.encode!(%{body: data, status: 200})
  end
end
