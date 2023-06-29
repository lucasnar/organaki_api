import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :organaki_api, OrganakiApi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "organaki_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :organaki_api, OrganakiApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "x5nscUfd9oO1OtLCWCv5luZkvfDADivOxhQ53PXCMroqj+9vX+cPwywpWGNT7pbf",
  server: false

config :organaki_api, OrganakiApi.Accounts.Guardian,
  issuer: "organaki_api",
  secret_key: "x5nscUfd9oO1OtLCWCv5luZkvfDADivOxhQ53PXCMroqj+9vX+cPwywpWGNT7pbf"

# In test we don't send emails.
config :organaki_api, OrganakiApi.Mailer, adapter: Swoosh.Adapters.Test

# From bcrypt's docs: Optional: during tests (and tests only), you may want to reduce the number of rounds so it does not slow down your test suite. If you have a config/test.exs, you should add:
config :bcrypt_elixir, :log_rounds, 4

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
