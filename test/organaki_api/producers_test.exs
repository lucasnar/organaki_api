defmodule OrganakiApi.ProducersTest do
  use OrganakiApi.DataCase

  alias OrganakiApi.Producers

  describe "producers" do
    alias OrganakiApi.Accounts.User

    import OrganakiApi.ProducersFixtures

    @invalid_attrs %{
      "email" => "any@email",
      "lat" => "a120.6",
      "lng" => 120.4,
      "short_description" => "any short_description"
    }

    test "list_producers/0 returns all visible producers" do
      producer = producer_fixture(%{"visible_producer" => true})
      assert Producers.list_producers() == [producer]
    end

    test "get_producer/1 returns the producer with given id" do
      producer = producer_fixture()
      assert {:ok, retrieved_producer} = Producers.get_producer(producer.id)
      assert retrieved_producer == producer
    end

    test "create_producer/1 with valid data creates a producer" do
      valid_attrs = %{
        "email" => "some@email",
        "lat" => 120.5,
        "lng" => 120.5,
        "name" => "some name",
        "short_description" => "some short_description"
      }

      assert {:ok, %User{}} = Producers.create_producer(valid_attrs)
    end

    test "create_producer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Producers.create_producer(@invalid_attrs)
    end

    test "update_producer/2 with valid data updates the producer" do
      producer = producer_fixture()
      update_attrs = %{}

      assert {:ok, %User{}} = Producers.update_producer(producer, update_attrs)
    end

    test "update_producer/2 with invalid data returns error changeset" do
      original_producer = producer_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Producers.update_producer(original_producer, @invalid_attrs)

      assert {:ok, producer} = Producers.get_producer(original_producer.id)
      assert producer == original_producer
    end

    test "delete_producer/1 deletes the producer" do
      producer = producer_fixture()
      assert {:ok, %User{}} = Producers.delete_producer(producer)
      assert {:error, :not_found} == Producers.get_producer(producer.id)
    end
  end
end
