defmodule OlympusClient.Health.Manager do
  
  @default_url "http://localhost:5008"
  @default_endpoint "/v1/health"

  def report_health(data) do
    body = Poison.encode!(data)
    headers = [{"Content-Type", "application/json"}]

    case HTTPoison.post(get_olympus_url(), body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {_, %HTTPoison.Response{body: body}} ->
        {:error, "Could not connect to Olympus: #{body}"}
      {_, %HTTPoison.Error{reason: reason}} ->
        {:error, "Could not connect to Olympus: #{reason}"}
    end
  end

  defp get_olympus_url do
    url = Application.get_env(:olympus, :url, @default_url)
    endpoint = Application.get_env(:olympus, :endpoint, @default_endpoint)

    url
    |> URI.merge(endpoint)
    |> URI.to_string
  end
end
