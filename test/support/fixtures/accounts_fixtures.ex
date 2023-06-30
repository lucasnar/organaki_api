defmodule OrganakiApi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OrganakiApi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        is_producer: true,
        lat: 120.5,
        lng: 120.5,
        name: "some name",
        short_description: "some short_description",
        password: "some password",
        address: "some address"
      })
      |> OrganakiApi.Accounts.create_user()

    user
  end
end
