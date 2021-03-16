defmodule ContractsApi.Superscription.Address do
  use Ecto.Schema
  import Ecto.Changeset

  alias ContractsApi.PhysicalPersons.Person
  alias ContractsApi.LegalEntytis.Company

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "addresses" do
    field :country, :string
    field :number, :string
    field :state, :string
    field :street, :string
    field :zip_code, :string

    belongs_to :person, Person
    belongs_to :company, Company

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:country, :street, :zip_code, :state, :number, :person_id, :company_id])
    |> foreign_key_constraint(:person_id)
    |> foreign_key_constraint(:company_id)
    |> validate_required([:country, :street, :zip_code, :state, :number])
  end
end
