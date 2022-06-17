defmodule BaseApi.Repo do
  use Ecto.Repo,
    otp_app: :base_api,
    adapter: Ecto.Adapters.Postgres
end
