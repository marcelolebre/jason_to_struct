# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :json_to_struct,
  ecto_repos: [JsonToStruct.Repo]

# Configures the endpoint
config :json_to_struct, JsonToStructWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tJDyLfO4sUeUxCiyTPdl6gJj52/E0S4vG4ERsOccXv6Zwqz0bHX5UjaVVzCiYXAz",
  render_errors: [view: JsonToStructWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JsonToStruct.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :json_to_struct, JsonToStructWeb.Endpoint,
   live_view: [
     signing_salt: "4ARO3XYgVBOY3T1gXx+TUAJTBDAbxAPY"
   ]

config :phoenix,
   template_engines: [leex: Phoenix.LiveView.Engine]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
