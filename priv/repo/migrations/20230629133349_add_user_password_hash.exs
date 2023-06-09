defmodule OrganakiApi.Repo.Migrations.AddUserPasswordHash do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :password_hash, :string
    end

    create unique_index(:users, [:email])
  end
end
