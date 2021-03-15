defmodule ContractsApiWeb.CovenantView do
  use ContractsApiWeb, :view
  alias ContractsApiWeb.CovenantView

  def render("index.json", %{covenant: contracts}) do
    render_many(contracts, CovenantView, "contract.json")
  end

  def render("show.json", %{covenant: contract}) do
    IO.inspect(contract)
    render_one(contract, CovenantView, "contract.json")
  end

  def render("contract.json", %{covenant: contract}) do
    %{
      id: contract.id,
      name: contract.name,
      description: contract.description,
      file_pdf: contract.file_pdf,
      date: contract.date,
      parts: %{
        physical_persons:
          Enum.map(contract.parts.physical_persons, fn person ->
            %{
              birth_date: person.birth_date,
              cpf: person.cpf,
              name: person.name
            }
          end),
        legal_entytis:
          Enum.map(contract.parts.legal_entytis, fn company ->
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
          end)
      }
    }
  end
end
