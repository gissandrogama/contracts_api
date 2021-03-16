defmodule ContractsApiWeb.PhysicalPersonsView do
  use ContractsApiWeb, :view
  alias ContractsApiWeb.PhysicalPersonsView

  def render("index.json", %{physical_persons: persons}) do
    render_many(persons, PhysicalPersonsView, "person.json")
  end

  def render("show.json", %{physical_persons: person}) do
    render_one(person, PhysicalPersonsView, "person.json")
  end

  def render("person.json", %{physical_persons: person}) do
    %{
      id: person.id,
      name: person.name,
      cpf: person.cpf,
      birth_date: person.birth_date,
      addresses:
      Enum.map(person.addresses, fn address ->
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
