# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :contracts_api,
  ecto_repos: [ContractsApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :contracts_api, ContractsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cuJ26XUIPEAVB5VHumNjSeqp9YNcNH3y5PhdHcAyL1wVCPGuiRWQ5YFJmtHEb37p",
  render_errors: [view: ContractsApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ContractsApi.PubSub,
  live_view: [signing_salt: "b8fGw+xs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
