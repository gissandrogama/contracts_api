defmodule ContractsApi.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :country, :string
      add :street, :string
      add :zip_code, :string
      add :state, :string
      add :number, :string
      add :company_id, references(:legal_entytis, on_delete: :nothing, type: :binary_id)
      add :person_id, references(:physical_persons, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:addresses, [:company_id])
    create index(:addresses, [:person_id])
  end
end
