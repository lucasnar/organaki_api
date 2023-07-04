defmodule OrganakiApi.Tags.UserTag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  @foreign_key_type :binary_id
  schema "user_tags" do
    belongs_to :user, OrganakiApi.Accounts.User, primary_key: true
    belongs_to :tag, OrganakiApi.Tags.Tag, primary_key: true
  end

  @doc false
  def changeset(user_tag, attrs) do
    user_tag
    |> cast(attrs, [:user_id, :tag_id])
    |> validate_required([:user_id, :tag_id])
  end
end
