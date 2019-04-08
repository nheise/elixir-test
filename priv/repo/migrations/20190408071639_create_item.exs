defmodule MyEctoTest.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def up do
    create table(:item,  primary_key: false) do
      add :id, :uuid, primary_key: true
      add :value, :integer
    end
  end
end
