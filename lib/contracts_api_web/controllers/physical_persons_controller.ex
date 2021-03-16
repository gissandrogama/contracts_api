defmodule ContractsApiWeb.PhysicalPersonsController do
  use ContractsApiWeb, :controller

  alias ContractsApi.PhysicalPersons

  action_fallback ContractsApiWeb.FallbackController

  def index(conn, _params) do
    with persons <- PhysicalPersons.list_persons() do
      render(conn, "index.json", physical_persons: persons)
    end
  end

  def create(conn, params) do
    with {:ok, person} <- PhysicalPersons.create_person(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.physical_persons_path(conn, :show, person))
      |> render("show.json", physical_persons: person)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, person} <- PhysicalPersons.get_person!(id) do
      render(conn, "show.json", physical_persons: person)
    end
  end
end
