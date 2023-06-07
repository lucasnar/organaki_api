defmodule OrganakiApi.Repo.Migrations.AddVisibleProducerToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :visible_producer, :bool, default: false
    end
  end
end
