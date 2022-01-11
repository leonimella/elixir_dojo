import Config

# Configures Elixir's Logger
config :logger, :console, format: "$time $metadata[$level] $message\n"

config :tesla, adapter: Tesla.Adapter.Hackney

config :elixir_dojo,
  bcb_mining_base_url: "https://www.bcb.gov.br",
  bcb_mining_path:
    "/api/search/app/normativos/buscanormativos?querytext=ContentType:normativo%20AND%20contentSource:normativos&rowlimit=1000&startrow=0&sortlist=Data1OWSDATE:descending&refinementfilters=Data:range(datetime(2022-01-01),datetime(2022-01-11T23:59:59))"
