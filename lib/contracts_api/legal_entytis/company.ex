defmodule ContractsApi.LegalEntytis.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.Superscription.Address
  alias ContractsApi.Part.Part

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "legal_entytis" do
    field :name, :string
    field :cnpj, :string

    belongs_to :part, Part

    has_many :addresses, Address

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :cnpj, :part_id])
    |> foreign_key_constraint(:part_id)
    |> cast_assoc(:addresses, with: &Address.changeset/2)
    |> validate_required([:name, :cnpj])
    |> unique_constraint(:cnpj, message: "CNPJ already registered")
  end
end
