defmodule ContractsApi.Repo.Migrations.CreatePhysicalPersons do
  use Ecto.Migration

  def change do
    create table(:physical_persons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :cpf, :string
      add :birth_date, :string
      add :contract_id, references(:contracts, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:physical_persons, [:contract_id])
  end
end
