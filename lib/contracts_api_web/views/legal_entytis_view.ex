defmodule ContractsApiWeb.LegalEntytisView do
  use ContractsApiWeb, :view
  alias ContractsApiWeb.LegalEntytisView

  def render("show.json", %{legal_entytis: company}) do
    render_one(company, LegalEntytisView, "company.json")
  end

  def render("company.json", %{legal_entytis: company}) do
    %{
      id: company.id,
      name: company.name,
      cnpj: company.cnpj
    }
  end
end
