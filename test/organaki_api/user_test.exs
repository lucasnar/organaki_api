defmodule OrganakiApi.UserTest do
  use OrganakiApi.DataCase

  alias OrganakiApi.User

  describe "producers" do
    alias OrganakiApi.User.Producer

    import OrganakiApi.UserFixtures

    @invalid_attrs %{email: nil, lat: nil, lng: nil, name: nil, password: nil, short_description: nil}

    test "list_producers/0 returns all producers" do
      producer = producer_fixture()
      assert User.list_producers() == [producer]
    end

    test "get_producer!/1 returns the producer with given id" do
      producer = producer_fixture()
      assert User.get_producer!(producer.id) == producer
    end

    test "create_producer/1 with valid data creates a producer" do
      valid_attrs = %{email: "some email", lat: 120.5, lng: 120.5, name: "some name", password: "some password", short_description: "some short_description"}

      assert {:ok, %Producer{} = producer} = User.create_producer(valid_attrs)
      assert producer.email == "some email"
      assert producer.lat == 120.5
      assert producer.lng == 120.5
      assert producer.name == "some name"
      assert producer.password == "some password"
      assert producer.short_description == "some short_description"
    end

    test "create_producer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_producer(@invalid_attrs)
    end

    test "update_producer/2 with valid data updates the producer" do
      producer = producer_fixture()
      update_attrs = %{email: "some updated email", lat: 456.7, lng: 456.7, name: "some updated name", password: "some updated password", short_description: "some updated short_description"}

      assert {:ok, %Producer{} = producer} = User.update_producer(producer, update_attrs)
      assert producer.email == "some updated email"
      assert producer.lat == 456.7
      assert producer.lng == 456.7
      assert producer.name == "some updated name"
      assert producer.password == "some updated password"
      assert producer.short_description == "some updated short_description"
    end

    test "update_producer/2 with invalid data returns error changeset" do
      producer = producer_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_producer(producer, @invalid_attrs)
      assert producer == User.get_producer!(producer.id)
    end

    test "delete_producer/1 deletes the producer" do
      producer = producer_fixture()
      assert {:ok, %Producer{}} = User.delete_producer(producer)
      assert_raise Ecto.NoResultsError, fn -> User.get_producer!(producer.id) end
    end

    test "change_producer/1 returns a producer changeset" do
      producer = producer_fixture()
      assert %Ecto.Changeset{} = User.change_producer(producer)
    end
  end
end
