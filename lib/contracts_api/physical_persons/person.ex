defmodule ContractsApi.PhysicalPersons.Person do
  use Ecto.Schema
  import Ecto.Changeset

  alias ContractsApi.Covenants.Contract

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "physical_persons" do
    field :birth_date, :string
    field :cpf, :string
    field :name, :string

    belongs_to :contract, Contract

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :cpf, :birth_date, :contract_id])
    |> foreign_key_constraint(:contract_id)
    |> validate_required([:name, :cpf, :birth_date])
  end
end
