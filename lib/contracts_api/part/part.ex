defmodule ContractsApi.Part.Part do
  use Ecto.Schema
  import Ecto.Changeset

  alias ContractsApi.{Covenant.Contract, LegalEntytis.Company, PhysicalPerson.Person}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "parts" do
    belongs_to :contract, Contract

    has_many :legal_entytis, Company
    has_many :physical_persons, Person


    timestamps()
  end

  @doc false
  def changeset(part, attrs) do
    part
    |> cast(attrs, [:contract_id])
    |> cast_assoc(:legal_entytis, with: &Company.changeset/2)
    |> cast_assoc(:physical_persons, with: &Person.changeset/2)
  end
end
