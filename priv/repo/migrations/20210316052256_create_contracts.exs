defmodule ContractsApi.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :file_pdf, :string
      add :name, :string
      add :description, :string
      add :date, :string
      add :list_parts, {:array, :string}

      timestamps()
    end
  end
end
