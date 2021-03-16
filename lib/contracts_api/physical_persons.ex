defmodule ContractsApi.PhysicalPersons do
  @moduledoc """
  Este modulo possui funções que persiste uma pessoa fisica no banco.
  Função `create_person/1`
  """
  alias ContractsApi.PhysicalPersons.Person
  alias ContractsApi.Repo

  @doc """
  Função lista todas as empresas persistidas no banco de dados.

  ## Examples

      iex> list_persons()
      [%Person{}, ...]
  """
  def list_persons do
    Repo.all(Person)
    |>  Repo.preload(:addresses)
  end

  @doc """
  Função que insere uma pessoa fisica no banco de dados. Essa função recebe um `map` com os campos e valores,
  faz um parser para `Person.changeset/2`, que valida as informações e retorna uma estrutura valida ou não.

  ## Paramentros da função
  - name: `nome` da pessoa
  - cpf: cpf da pessoa
  - birth_date: data de aniversário
  - endereço: informações a serem passadas em uma lista de map (:country, :state, :street, :number, :zip_code)

  ## Examples

      iex> create_person(%{field: value})
      {:ok, %ContractsApi.PhysicalPersons.Person{}}

      iex> create_person(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_person(attrs \\ %{}) do
    %Person{}
    |> Person.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Essa função busca uma pessa pelo `id`.

  ## Paramentros da função
  - id: `id` numero de indentificação da pessoa

  ## Informações adcionais
    - caso id estaja incorreto ou não exista é retornado um `nil`.

  ## Example empty lists

       iex> person = create_person(%{name: "name person", cpf: "1234567897", birth_date: "13/05/1988"})
       iex> get_company!(person.id)
       {:ok, %ContractsApi.PhysicalPersons.Person{}}

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
