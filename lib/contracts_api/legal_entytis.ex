defmodule ContractsApi.LegalEntytis do
  @moduledoc """
  Este modulo possui funções que persiste uma compania no banco.
  Função `create_company/1`
  """
  alias ContractsApi.LegalEntytis.Company
  alias ContractsApi.Repo
  @doc """
  Função que insere uma compania no banco de dados. Essa função recebe um `map` com os campos e valores,
  faz um parser para `Company.changeset/2`, que valida as informações e retorna uma estrutura valida ou não.

  ## Paramentros da função
  - nome: `nome` da empresa
  - CNPJ: cnpj da empresa
  - endereço: informações a serem passadas em um map (:country, :state, :street, :zip_code)

  ## Examples

      iex> Company.create_company(%{field: value})
      {:ok, %ContractsApi.LegalEntytis.Company{}}

      iex> EventsApi.create_user(%{field: bad_value})

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Essa função busca um compania pelo `id`.

  ## Paramentros da função
  - id: `id` numero de indentificação do usuário

  ## Informações adcionais
    - caso id estaja incorreto ou não exista é retornado um `nil`.

  ## Example empty lists

       iex> company = create_company(%{name: "name company", cnpj: "1234567897", addresses: %{country: "Brasil", state: "PA", street: "RUA A", :zip_code,}})
       iex> get_company!(company.id)
       {:ok, %ContractsApi.LegalEntytis.Company{}}

  """
  def get_company!(id) do
    Repo.get_by(Company, id: id)
    |> Repo.preload(:addresses)
    |> case do
      nil -> {:error, :not_found}
      company -> {:ok, company}
    end
  end
end
