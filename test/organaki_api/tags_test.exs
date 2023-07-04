defmodule OrganakiApi.TagsTest do
  use OrganakiApi.DataCase

  alias OrganakiApi.Tags

  describe "tags" do
    alias OrganakiApi.Tags.Tag

    import OrganakiApi.TagsFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Tags.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Tags.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tag{} = tag} = Tags.create_tag(valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tags.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tag{} = tag} = Tags.update_tag(tag, update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Tags.update_tag(tag, @invalid_attrs)
      assert tag == Tags.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Tags.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Tags.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Tags.change_tag(tag)
    end
  end

  describe "user_tags" do
    alias OrganakiApi.Tags.UserTag

    import OrganakiApi.TagsFixtures
    import OrganakiApi.AccountsFixtures

    @invalid_attrs %{user_id: 1}

    test "list_user_tags/0 returns all user_tags" do
      user_tag = user_tag_fixture()
      assert Tags.list_user_tags() == [user_tag]
    end

    test "get_user_tag!/1 returns the user_tag with given user_id and tag_id pair" do
      user_tag = user_tag_fixture()
      assert Tags.get_user_tag!(user_tag.user_id, user_tag.tag_id) == user_tag
    end

    test "create_user_tag/1 with valid data creates a user_tag" do
      user = user_fixture()
      tag = tag_fixture()

      valid_attrs = %{user_id: user.id, tag_id: tag.id}

      assert {:ok, %UserTag{}} = Tags.create_user_tag(valid_attrs)
    end

    test "create_user_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tags.create_user_tag(@invalid_attrs)
    end

    test "update_user_tag/2 with valid data updates the user_tag" do
      user_tag = user_tag_fixture()
      update_attrs = %{}

      assert {:ok, %UserTag{}} = Tags.update_user_tag(user_tag, update_attrs)
    end

    test "update_user_tag/2 with invalid data returns error changeset" do
      user_tag = user_tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Tags.update_user_tag(user_tag, @invalid_attrs)
      assert user_tag == Tags.get_user_tag!(user_tag.user_id, user_tag.tag_id)
    end

    test "delete_user_tag/1 deletes the user_tag" do
      user_tag = user_tag_fixture()
      assert {:ok, %UserTag{}} = Tags.delete_user_tag(user_tag)

      assert_raise Ecto.NoResultsError, fn ->
        Tags.get_user_tag!(user_tag.user_id, user_tag.tag_id)
      end
    end

    test "change_user_tag/1 returns a user_tag changeset" do
      user_tag = user_tag_fixture()
      assert %Ecto.Changeset{} = Tags.change_user_tag(user_tag)
    end
  end
end
