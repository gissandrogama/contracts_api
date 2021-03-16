defmodule ContractsApi.LegalEntytis.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.Covenants.Contract
  alias ContractsApi.Superscription.Address

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "legal_entytis" do
    field :cnpj, :string
    field :name, :string

    belongs_to :contract, Contract
    has_many :addresses, Address

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :cnpj, :contract_id])
    |> foreign_key_constraint(:contract_id)
    |> cast_assoc(:addresses, with: &Address.changeset/2)
    |> validate_required([:name, :cnpj])
  end
end
