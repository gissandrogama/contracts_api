defmodule ContractsApi.Repo.Migrations.CreateParts do
  use Ecto.Migration

  def change do
    create table(:parts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :contract_id, references(:contracts, on_delete: :nilify_all, type: :binary_id)

      timestamps()
    end

    create index(:parts, [:contract_id])
  end
end
