defmodule ContractsApi.Covenant.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  alias ContractsApi.Part.Part

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "contracts" do
    field :date, :string
    field :description, :string
    field :file_pdf, :string
    field :name, :string

    has_one :parts, Part

    timestamps()
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:file_pdf, :name, :description, :date])
    |> cast_assoc(:parts, with: &Part.changeset/2)
    |> validate_required([:file_pdf, :name, :description, :date])
  end
end
