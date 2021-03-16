defmodule ContractsApiWeb.CovenantsController do
  use ContractsApiWeb, :controller

  alias ContractsApi.Covenant

  action_fallback ContractsApiWeb.FallbackController

  def index(conn, _params) do
    with contracts <- Covenant.list_contracts() do
      render(conn, "index.json", covenant: contracts)
    end
  end

  def create(conn, params) do
    with {:ok, contract} <- Covenant.create_contract(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.covenant_path(conn, :show, contract))
      |> render("show.json", covenant: contract)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, contract} <- Covenant.get_contract!(id) do
      render(conn, "show.json", covenant: contract)
    end
  end
end
