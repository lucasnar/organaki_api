defmodule OrganakiApi.Producers do
  @moduledoc """
  The Producers context.
  """

  import Ecto.Query, warn: false
  alias OrganakiApi.Repo

  alias OrganakiApi.Accounts
  alias OrganakiApi.Accounts.User

  @doc """
  Returns the list of users who are visible producers.

  ## Examples

      iex> list_producers()
      [%User{}, ...]

  """
  def list_producers do
    Repo.all(
      from u in User, where: u.is_producer == true and u.visible_producer == true, preload: :tags
    )
  end

  @doc """
  Gets a single producer.

  returns {:error, :not_found} when User can't be found.

  ## Examples

      iex> get_producer(123)
      %User{}

  """
  def get_producer(id) do
    query = from u in User, where: u.is_producer == true and u.id == ^id

    case Repo.one(query) do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end

  @doc """
  Creates a producer.
  TODO: update this doc.

  ## Examples

      iex> create_producer(%{field: value})
      {:ok, %User{}}

      iex> create_producer(%{field: bad_value})
      {:error, ...}

  """
  def create_producer(attrs) do
    try do
      attrs
      |> Enum.map(fn {k, v} -> {String.to_existing_atom(k), v} end)
      |> Map.new()
      |> Map.put(:is_producer, true)
      |> Accounts.create_user()
    rescue
      _e in ArgumentError -> {:error, :unprocessable_entity}
    end
  end

  def create_producer(attrs, tags) do
    try do
      attrs
      |> Enum.map(fn {k, v} -> {String.to_existing_atom(k), v} end)
      |> Map.new()
      |> Map.put(:tags, tags)
      |> Map.put(:is_producer, true)
      |> Accounts.create_user()
    rescue
      _e in ArgumentError -> {:error, :unprocessable_entity}
    end
  end

  @doc """
  Updates a producer.
  TODO: update this doc.

  ## Examples

      iex> update_producer(producer, %{field: new_value})
      {:ok, %User{}}

      iex> update_producer(producer, %{field: bad_value})
      {:error, ...}

  """
  def update_producer(%User{is_producer: true} = producer, attrs) do
    Accounts.update_user(producer, attrs)
  end

  def update_producer(%User{is_producer: true} = producer, attrs, tags) do
    attrs = Map.merge(attrs, %{"tags" => tags})

    Accounts.update_user(producer, attrs)
  end

  def update_producer(_, _, _) do
    {:error, :unprocessable_entity}
  end

  @doc """
  Deletes a producer.
  TODO: update this doc.

  ## Examples

      iex> delete_producer(producer)
      {:ok, %User{}}

      iex> delete_producer(producer)
      {:error, ...}

  """
  def delete_producer(%User{is_producer: true} = producer) do
    Accounts.delete_user(producer)
  end

  def preload_tags(%User{is_producer: true} = producer) do
    Repo.preload(producer, :tags)
  end
end
