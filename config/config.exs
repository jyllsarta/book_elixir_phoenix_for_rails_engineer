# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :book_elixir_phoenix_for_rails_engineer,
  ecto_repos: [BookElixirPhoenixForRailsEngineer.Repo]

# Configures the endpoint
config :book_elixir_phoenix_for_rails_engineer, BookElixirPhoenixForRailsEngineerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OWZ0SKRFgw3hf2VEDGTY8mijoPo1kB1LLnL+mZ1RW3xLkdztpYNRSfKLk+h97lD9",
  render_errors: [view: BookElixirPhoenixForRailsEngineerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BookElixirPhoenixForRailsEngineer.PubSub,
  live_view: [signing_salt: "Ec1XUhdP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures pow
config :book_elixir_phoenix_for_rails_engineer, :pow,
  user: BookElixirPhoenixForRailsEngineer.Users.User,
  repo: BookElixirPhoenixForRailsEngineer.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
