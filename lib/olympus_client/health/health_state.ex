defmodule OlympusClient.Health.HealthState do
  defstruct [
    name: "DEFAULT",
    start_time: DateTime.utc_now(),
    last_report_time: nil,
    status: :ok,
    error: nil
  ]
end