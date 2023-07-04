defmodule OrganakiApi.TagsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OrganakiApi.Tags` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> OrganakiApi.Tags.create_tag()

    tag
  end

  @doc """
  Generate a user_tag.
  """
  def user_tag_fixture(attrs \\ %{}) do
    user = OrganakiApi.AccountsFixtures.user_fixture()
    tag = tag_fixture()

    {:ok, user_tag} =
      attrs
      |> Enum.into(%{
        user_id: user.id,
        tag_id: tag.id
      })
      |> OrganakiApi.Tags.create_user_tag()

    user_tag
  end
end
