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

    many_to_many :tags,
                 OrganakiApi.Tags.Tag,
                 join_through: "user_tags",
                 on_replace: :delete

    timestamps()
  end

  @required_fields ~w(name email lat lng short_description is_producer)a

  @optional_fields ~w(address advertisement contact opening_hours organic_seal password seal_number visible_producer)a

  @all_fields @required_fields ++ @optional_fields

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @all_fields)
    |> validate_required(@required_fields)
    |> maybe_put_assoc(attrs)
    |> unique_constraint(:email)
    |> password_hash()
  end

  @doc false
  defp maybe_put_assoc(changeset, %{tags: tags}), do: put_assoc(changeset, :tags, tags)

  defp maybe_put_assoc(changeset, %{"tags" => tags}), do: put_assoc(changeset, :tags, tags)

  defp maybe_put_assoc(changeset, _), do: changeset

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
