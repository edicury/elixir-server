defmodule Server.Application do
  use Application

  alias Server.Endpoint

  def start(_type, _args),
    do: Supervisor.start_link(children(), opts())

  defp children do
    [
      Endpoint
    ]
  end

  defp opts do
    [
      strategy: :one_for_one,
      name: Server.Supervisor
    ]
  end
end
