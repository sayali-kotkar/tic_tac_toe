# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :tic_tac_toe, TicTacToeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GYnkboyDiXRKpDbJFTpdSAyMkJ4+BDMO+V3LzwwiGISaZbylZW8+GbFJzm1MfZTZ",
  render_errors: [view: TicTacToeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TicTacToe.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "LdVg/+oF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
