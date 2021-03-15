defmodule ContractsApi.Repo.Migrations.AddFieldsContracts do
  use Ecto.Migration

  def change do
    alter table(:contracts) do
      remove :company_id
      remove :person_id
    end
  end
end
