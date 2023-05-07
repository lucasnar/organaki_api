defmodule OrganakiApi.Repo do
  use Ecto.Repo,
    otp_app: :organaki_api,
    adapter: Ecto.Adapters.Postgres
end
