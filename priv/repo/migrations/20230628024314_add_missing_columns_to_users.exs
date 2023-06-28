defmodule OrganakiApi.Repo.Migrations.AddMissingColumnsToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :address, :string
      add :contact, :string
      add :opening_hours, :string
      add :advertisement, :string
      add :organic_seal, :bool, default: false
      add :seal_number, :string
    end
  end
end
