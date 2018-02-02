# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :tesla, adapter: Tesla.Adapter.Httpc

config :logger, :console,
  level: :debug,
  format: "$date $time [$level] $metadata$message\n"

if Mix.env == :test do
  config :httparrot,
    http_port: 5080,
    https_port: 5443,
    ssl: true,
    unix_socket: false

  config :sasl,
    errlog_type: :error,
    sasl_error_logger: false

  config :tesla, MockClient, adapter: Tesla.Mock
end
