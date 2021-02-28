defmodule ContractsApi.Repo do
  use Ecto.Repo,
    otp_app: :contracts_api,
    adapter: Ecto.Adapters.Postgres
end
