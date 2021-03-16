defmodule ContractsApi.Covenants do
  @moduledoc """
  Este modulo possui funções que persiste um contrato no banco.
  Função `create_contract/1`
  """

  import Ecto.Query

  alias ContractsApi.Covenants.Contract
  alias ContractsApi.Repo

  @doc """
  Função lista todos os contratos persistidas no banco de dados.

  ## Examples

      iex> list_contracts()
      [%Contract{}, ...]
  """
  def list_contracts do
    ContractsApi.Repo.all(
      from c in ContractsApi.Covenants.Contract,
        preload: [parts: [:physical_persons, legal_entytis: [:addresses]]]
    )
  end

  @doc """
  Função que insere um contrato no banco de dados. Essa função recebe um `map` com os campos e valores,
  faz um parser para `Contract.changeset/2`, que valida as informações e retorna uma estrutura valida ou não.

  ## Paramentros da função
  - name: `nome` do contrati
  - file_pdf: url do arquivo anexado
  - description: uma breve descrição do documento
  - date: data de criação do contrato

  ## Examples

      iex> create_contract(%{field: value})
      {:ok, %ContractsApi.LegalEntytis.contracts{}}

      iex> create_contract(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_contract(attrs \\ %{}) do
    %Contract{}
    |> Contract.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Essa função busca um contrato pelo `id`.

  ## Paramentros da função
  - id: `id` numero de indentificação do contrato

  ## Informações adcionais
    - caso id estaja incorreto ou não exista é retornado um `nil`.

  ## Example empty lists

       iex> contract = create_contract(%{date: "15/03/2021", description: "contrato estalece a locaçao de imovel para finz residenciais", file_pdf: "url_file", name: "contrato de aluguel de imovel"})
       iex> get_contract!(contract.id)
       {:ok, %ContractsApi.LegalEntytis.Contract{}}

  """
  def get_contract!(id) do
    query =
      from c in ContractsApi.Covenants.Contract,
        preload: [parts: [:physical_persons, legal_entytis: [:addresses]]]

    Repo.get_by(query, id: id)
    |> case do
      nil -> {:error, :not_found}
      contract -> {:ok, contract}
    end
  end
end
