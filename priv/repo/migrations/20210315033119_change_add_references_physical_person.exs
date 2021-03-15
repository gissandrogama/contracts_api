defmodule ContractsApi.Repo.Migrations.ChangeAddReferencesPhysicalPerson do
  use Ecto.Migration

  def change do
    alter table(:physical_persons) do
      add :part_id, references(:parts, on_delete: :nilify_all, type: :binary_id)
    end
  end
end
