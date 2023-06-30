defmodule OrganakiApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :visible_producer, :boolean, default: false
    field :email, :string
    field :is_producer, :boolean, default: false
    field :lat, :float
    field :lng, :float
    field :name, :string
    field :short_description, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :name,
      :email,
      :short_description,
      :lat,
      :lng,
      :is_producer,
      :visible_producer,
      :password
    ])
    |> validate_required([:name, :email, :password, :short_description, :lat, :lng, :is_producer])
    |> unique_constraint(:email)
    |> password_hash()
  end

  @doc false
  defp password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))

      %Ecto.Changeset{valid?: true, changes: _} ->
        changeset

      %Ecto.Changeset{valid?: false} ->
        changeset
    end
  end
end
