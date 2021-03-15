defmodule ContractsApi.Repo.Migrations.ChangeAddReferencesLegalEntytis do
  use Ecto.Migration

  def change do
    alter table(:legal_entytis) do
      add :part_id, references(:parts, on_delete: :nilify_all, type: :binary_id)
    end
  end
end
