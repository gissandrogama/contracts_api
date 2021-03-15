defmodule ContractsApi.Superscription.Address do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.LegalEntyti.Company
  alias ContractsApi.PhysicalPerson.Person

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "addresses" do
    field :country, :string
    field :state, :string
    field :street, :string
    field :zip_code, :string

    belongs_to :company, Company
    belongs_to :person, Person

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:country, :state, :street, :zip_code, :company_id, :person_id])
    |> validate_format(:zip_code, ~r/\d{5}-\d{3}/, message: "invalid zip code format")
    |> foreign_key_constraint(:company_id)
    |> foreign_key_constraint(:person_id)
    |> validate_required([:country, :state, :street, :zip_code])
  end
end
