defmodule OlympusClient.Health.Reporter do
  @doc """
  Health Reporter Application
  """

  use GenServer
  
  require Logger

  alias OlympusClient.Health.Manager

  @report_interval 5_000

  ## Client API

  @doc """
  Starts the health reporter.
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  ## Server Callbacks

  def init(:ok) do
    Logger.info "Health system online!"
    state = %{
      name: Application.get_env(:olympus, :service_name, "DEFAULT"),
      start_time: DateTime.utc_now
    }
    schedule_heartbeat()
    {:ok, nil}
  end

  def handle_info(:report_health, state) do
    Logger.info "REPORTING THAT WE ARE HEALTHY <3"
    report = Manager.report_health(state) |> IO.inspect(label: "REPORT")
    schedule_heartbeat()
    {:noreply, state}
  end

  # Schedules next health report with the report interval
  @spec schedule_heartbeat :: any() 
  defp schedule_heartbeat do
    Process.send_after(self(), :report_health, @report_interval)
  end
end
