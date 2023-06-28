defmodule OrganakiApi.Repo.Migrations.CreateUserTags do
  use Ecto.Migration

  def change do
    create table(:user_tags, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:user, on_delete: :nothing, type: :binary_id)
      add :tag_id, references(:tags, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:user_tags, [:user_id])
    create index(:user_tags, [:tag_id])
  end
end
