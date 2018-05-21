defmodule OlympusClient.Supervisor do
  @moduledoc false

  use Supervisor

  @doc """
  Starts the Olympus Client Supervisor.
  """
  @spec start_link(Keyword.t()) :: GenServer.on_start()
  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      OlympusClient.HealthReporter
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
