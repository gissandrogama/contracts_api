defmodule ContractsApi.LegalEntytis.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.Superscription.Address
  alias ContractsApi.Covenant.Contract

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "legal_entytis" do
    field :name, :string
    field :cnpj, :string

    has_many :addresses, Address
    has_many :contracts, Contract

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :cnpj])
    |> cast_assoc(:addresses, with: &Address.changeset/2)
    |> cast_assoc(:contracts, with: &Contract.changeset/2)
    |> validate_required([:name, :cnpj])
    |> unique_constraint(:cnpj, message: "CNPJ already registered")
  end
end
