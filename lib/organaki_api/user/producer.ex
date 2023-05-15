defmodule OrganakiApi.User.Producer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "producers" do
    field :email, :string
    field :lat, :float
    field :lng, :float
    field :name, :string
    field :password, :string
    field :short_description, :string

    timestamps()
  end

  @doc false
  def changeset(producer, attrs) do
    producer
    |> cast(attrs, [:name, :short_description, :email, :password, :lat, :lng])
    |> validate_required([:name, :short_description, :email, :password, :lat, :lng])
  end
end
