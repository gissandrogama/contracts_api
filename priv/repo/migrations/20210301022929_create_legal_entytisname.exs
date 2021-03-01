defmodule ContractsApi.Repo.Migrations.CreateLegalEntytisname do
  use Ecto.Migration

  def change do
    create table(:legal_entytis, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :cnpj, :string

      timestamps()
    end

  end
end
