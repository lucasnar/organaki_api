defmodule OrganakiApi.ProducersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OrganakiApi.Producers` context.
  """

  @doc """
  Generate a user.
  """
  def producer_fixture(attrs \\ %{}) do
    {:ok, producer} =
      attrs
      |> Enum.into(%{
        "email" => "some email",
        "lat" => 120.5,
        "lng" => 120.5,
        "name" => "some name",
        "short_description" => "some short_description"
      })
      |> OrganakiApi.Producers.create_producer()

    producer
  end
end
