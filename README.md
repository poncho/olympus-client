# Olympus Client

> Health heartbeat client to communicate with Olympus

## Installation

The package can be installed by adding `olympus_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:olympus_client, github: "poncho/olympus-client"}
  ]
end
```

Add your Olympus configuration after in your config.exs file

```elixir
config :olympus_client,
  url: "",
  app_name: "",
```

- ***url:** Olympus URL
- ***name:** Your application name
