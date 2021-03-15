defmodule ContractsApi.PhysicalPerson.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias ContractsApi.Superscription.Address
  alias ContractsApi.Part.Part

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "physical_persons" do
    field :birth_date, :string
    field :cpf, :string
    field :name, :string

    belongs_to :part, Part

    has_many :addresses, Address

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :cpf, :birth_date, :part_id])
    |> cast_assoc(:addresses, with: &Address.changeset/2)
    |> validate_required([:name, :cpf, :birth_date])
    |> unique_constraint(:cpf, message: "CPF already registered")
  end
end
