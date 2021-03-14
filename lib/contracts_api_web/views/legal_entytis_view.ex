defmodule ContractsApiWeb.LegalEntytisView do
  use ContractsApiWeb, :view
  alias ContractsApiWeb.LegalEntytisView

  def render("show.json", %{legal_entytis: company}) do
    IO.inspect(company)
    render_one(company, LegalEntytisView, "company.json")
  end

  def render("company.json", %{legal_entytis: company}) do
    %{
      id: company.id,
      name: company.name,
      cnpj: company.cnpj,
      addresses:
      Enum.map(company.addresses, fn address ->
        %{
          country: address.country,
          state: address.state,
          street: address.street,
          zip_code: address.zip_code
        }
      end)
    }
  end
end
