defmodule OrganakiApi.Tags.UserTag do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "user_tags" do

    field :user_id, :binary_id
    field :tag_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(user_tag, attrs) do
    user_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
