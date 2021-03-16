defmodule ContractsApi.Repo.Migrations.CreateLegalEntytis do
  use Ecto.Migration

  def change do
    create table(:legal_entytis, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :cnpj, :string
      add :contract_id, references(:contracts, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:legal_entytis, [:contract_id])
  end
end
