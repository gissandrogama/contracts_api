defmodule ContractsApiWeb.LegalEntytisController do
  use ContractsApiWeb, :controller

  alias ContractsApi.LegalEntytis

  action_fallback ContractsApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, company} <- LegalEntytis.create_company(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.legal_entytis_path(conn, :show, company))
      |> render("show.json", legal_entytis: company)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, company} <- LegalEntytis.get_company!(id) do
      render(conn, "show.json", legal_entytis: company)
    end
  end
end
