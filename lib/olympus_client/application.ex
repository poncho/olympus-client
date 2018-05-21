defmodule OlympusClient.Application do
  @moduledoc false

  use Application

  @doc """
  Starts the health reporter
  """
  def start(_type, _args) do
    children = []
    opts = [strategy: :one_for_one, name: OlympusClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
