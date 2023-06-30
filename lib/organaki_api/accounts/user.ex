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
    field :address, :string
    field :contact, :string
    field :opening_hours, :string
    field :advertisement, :string
    field :organic_seal, :boolean, default: false
    field :seal_number, :string

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
      :password,
      :address,
      :contact,
      :opening_hours,
      :advertisement,
      :organic_seal,
      :seal_number
    ])
    |> validate_required([:name, :email, :password, :short_description, :lat, :lng, :is_producer, :address])
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
