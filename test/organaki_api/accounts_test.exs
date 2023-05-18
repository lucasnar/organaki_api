defmodule OrganakiApi.AccountsTest do
  use OrganakiApi.DataCase

  alias OrganakiApi.Accounts

  describe "users" do
    alias OrganakiApi.Accounts.User

    import OrganakiApi.AccountsFixtures

    @invalid_attrs %{
      email: nil,
      is_producer: nil,
      lat: nil,
      lng: nil,
      name: nil,
      short_description: nil
    }

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        email: "some email",
        is_producer: true,
        lat: 120.5,
        lng: 120.5,
        name: "some name",
        short_description: "some short_description"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.is_producer == true
      assert user.lat == 120.5
      assert user.lng == 120.5
      assert user.name == "some name"
      assert user.short_description == "some short_description"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        email: "some updated email",
        is_producer: false,
        lat: 456.7,
        lng: 456.7,
        name: "some updated name",
        short_description: "some updated short_description"
      }

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.is_producer == false
      assert user.lat == 456.7
      assert user.lng == 456.7
      assert user.name == "some updated name"
      assert user.short_description == "some updated short_description"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
