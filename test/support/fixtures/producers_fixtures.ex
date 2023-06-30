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
      %{
        "email" => "some@email",
        "lat" => 120.5,
        "lng" => 120.5,
        "name" => "some name",
        "short_description" => "some short_description",
        "visible_producer" => false,
        "password" => "some password",
        "address" => "some address",
        "contact" => "some contact",
        "opening_hours" => "some opening_hours",
        "advertisement" => "some advertisement",
        "organic_seal" => true,
        "seal_number" => "some seal_number"
      }
      |> Map.merge(attrs)
      |> OrganakiApi.Producers.create_producer()

    producer
  end
end
