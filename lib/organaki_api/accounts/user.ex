defmodule OrganakiApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :is_producer, :boolean, default: false
    field :lat, :float
    field :lng, :float
    field :name, :string
    field :short_description, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :short_description, :lat, :lng, :is_producer])
    |> validate_required([:name, :email, :short_description, :lat, :lng, :is_producer])
  end
end
