defmodule ContractsApi.Covenant.Contract do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.LegalEntyti.Company
  alias ContractsApi.PhysicalPerson.Person

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "contracts" do
    field :date, :string
    field :description, :string
    field :file_pdf, :string
    field :name, :string

    belongs_to :company, Company
    belongs_to :person, Person

    timestamps()
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:file_pdf, :name, :description, :date, :company_id, :person_id])
    |> foreign_key_constraint(:company_id, :person_id)
    |> validate_required([:file_pdf, :name, :description, :date])
  end
end
