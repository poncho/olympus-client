defmodule OlympusClientTest do
  use ExUnit.Case
  doctest OlympusClient

  test "greets the world" do
    assert OlympusClient.hello() == :world
  end
end
