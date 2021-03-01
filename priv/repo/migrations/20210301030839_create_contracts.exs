defmodule ContractsApi.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :file_pdf, :string
      add :name, :string
      add :description, :string
      add :date, :string
      add :company_id, references(:legal_entytis, on_delete: :nilify_all, type: :binary_id)
      add :person_id, references(:physical_persons, on_delete: :nilify_all, type: :binary_id)

      timestamps()
    end

    create index(:contracts, [:company_id])
    create index(:contracts, [:person_id])
  end
end
