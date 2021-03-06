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
end
