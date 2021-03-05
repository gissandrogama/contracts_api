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
    |> cast(attrs, [:cnpj])
    |> cast_assoc(:addresses, with: &Address.changeset/2)
    |> cast_assoc(:contracts, with: &Contract.changeset/2)
    |> validate_required([:cnpj])
  end
end
