defmodule ContractsApi.Covenants.Contract do
  @moduledoc """
  schema of contract
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias ContractsApi.LegalEntytis.Company
  alias ContractsApi.PhysicalPersons.Person

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "contracts" do
    field :date, :string
    field :description, :string
    field :file_pdf, :string
    field :list_parts, {:array, :string}
    field :name, :string

    has_many :physical_persons, Person
    has_many :legal_entytis, Company
    timestamps()
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:file_pdf, :name, :description, :date, :list_parts])
    |> cast_assoc(:physical_persons, with: &Person.changeset/2)
    |> cast_assoc(:legal_entytis, with: &Company.changeset/2)
    |> validate_required([:file_pdf, :name, :description, :date, :list_parts])
  end
end
