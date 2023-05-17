defmodule OrganakiApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :short_description, :string
      add :lat, :float
      add :lng, :float
      add :is_producer, :boolean, default: false, null: false

      timestamps()
    end
  end
end
