defmodule ContractsApi.LegalEntyti.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.Superscription.Address

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "legal_entytis" do
    field :name, :string
    field :cnpj, :string

    has_many :addresses, Address

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:cnpj])
    |> cast_assoc(:addresses, with: &Address.changeset/2)
    |> validate_required([:cnpj])
  end
end
