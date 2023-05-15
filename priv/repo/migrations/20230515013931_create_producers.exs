defmodule OrganakiApi.Repo.Migrations.CreateProducers do
  use Ecto.Migration

  def change do
    create table(:producers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :short_description, :string
      add :email, :string
      add :password, :string
      add :lat, :float
      add :lng, :float

      timestamps()
    end
  end
end
