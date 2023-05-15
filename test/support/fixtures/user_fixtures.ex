defmodule OrganakiApi.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OrganakiApi.User` context.
  """

  @doc """
  Generate a producer.
  """
  def producer_fixture(attrs \\ %{}) do
    {:ok, producer} =
      attrs
      |> Enum.into(%{
        email: "some email",
        lat: 120.5,
        lng: 120.5,
        name: "some name",
        password: "some password",
        short_description: "some short_description"
      })
      |> OrganakiApi.User.create_producer()

    producer
  end
end
