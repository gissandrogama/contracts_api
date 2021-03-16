defmodule ContractsApi.LegalEntytisTest do
  use ContractsApi.DataCase, async: true
  alias ContractsApi.LegalEntytis

  describe "create_company/1" do
    test "return company structure when parameters are valid" do
      {:ok, result} = LegalEntytis.create_company(%{name: "SCJ LTDA", cnpj: "1245786000177"})

      assert result.name == "SCJ LTDA"
      assert result.cnpj == "1245786000177"
    end

    test "return company error when parameters are in_valid" do
      assert {:error, %Ecto.Changeset{} = changeset} =
               LegalEntytis.create_company(%{name: "", cnpj: "1245786000177"})

      %{name: ["can't be blank"]} = errors_on(changeset)
    end
  end

  describe "get_company!" do
    test "return a company when the id is valid" do
      {:ok, %{id: id}} = LegalEntytis.create_company(%{name: "CLOE LTDA", cnpj: "1245786000177"})

      {:ok, result} = LegalEntytis.get_company!(id)

      assert result.name == "CLOE LTDA"
      assert result.cnpj == "1245786000177"
    end

    test "Return error when id or company does not exist" do
      LegalEntytis.create_company(%{name: "CLOE LTDA", cnpj: "1245786000177"})
      id_invalid = "2af084fe-a625-44d1-b3f5-dda7000501a9"

      assert LegalEntytis.get_company!(id_invalid) == {:error, :not_found}
    end
  end
end
