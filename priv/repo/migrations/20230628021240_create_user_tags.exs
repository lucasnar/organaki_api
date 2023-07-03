defmodule OrganakiApi.Repo.Migrations.CreateUserTags do
  use Ecto.Migration

  def change do
    create table(:user_tags, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id),
        primary_key: true

      add :tag_id, references(:tags, on_delete: :delete_all, type: :binary_id), primary_key: true
    end

    create unique_index(:user_tags, [:user_id, :tag_id])
  end
end
