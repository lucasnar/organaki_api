defmodule OrganakiApi.Tags do
  @moduledoc """
  The Tags context.
  """

  import Ecto.Query, warn: false
  alias OrganakiApi.Repo

  alias OrganakiApi.Tags.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{data: %Tag{}}

  """
  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end

  alias OrganakiApi.Tags.UserTag

  @doc """
  Returns the list of user_tags.

  ## Examples

      iex> list_user_tags()
      [%UserTag{}, ...]

  """
  def list_user_tags do
    Repo.all(UserTag)
  end

  @doc """
  Gets a single user_tag.

  Raises `Ecto.NoResultsError` if the User tag does not exist.

  ## Examples

      iex> get_user_tag!(123)
      %UserTag{}

      iex> get_user_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_tag!(id), do: Repo.get!(UserTag, id)

  @doc """
  Creates a user_tag.

  ## Examples

      iex> create_user_tag(%{field: value})
      {:ok, %UserTag{}}

      iex> create_user_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_tag(attrs \\ %{}) do
    %UserTag{}
    |> UserTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_tag.

  ## Examples

      iex> update_user_tag(user_tag, %{field: new_value})
      {:ok, %UserTag{}}

      iex> update_user_tag(user_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_tag(%UserTag{} = user_tag, attrs) do
    user_tag
    |> UserTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_tag.

  ## Examples

      iex> delete_user_tag(user_tag)
      {:ok, %UserTag{}}

      iex> delete_user_tag(user_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_tag(%UserTag{} = user_tag) do
    Repo.delete(user_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_tag changes.

  ## Examples

      iex> change_user_tag(user_tag)
      %Ecto.Changeset{data: %UserTag{}}

  """
  def change_user_tag(%UserTag{} = user_tag, attrs \\ %{}) do
    UserTag.changeset(user_tag, attrs)
  end
end
