# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cv_creator,
  ecto_repos: [CvCreator.Repo]

# Configures the endpoint
config :cv_creator, CvCreatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uObahjrGy/JFLXwF5FI75E12Mbw0/Wenf48QCKvIvsOc1OcdKPzVrXkqXLj426V+",
  render_errors: [view: CvCreatorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CvCreator.PubSub,
  live_view: [signing_salt: "o+M8LoNF"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
