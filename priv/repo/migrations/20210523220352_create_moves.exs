defmodule Loco.Repo.Migrations.CreateMoves do
  use Ecto.Migration

  def change do
    create table(:moves) do
      add :name, :string, null: false
      add :destination, :string, null: false
      add :start, :utc_datetime
      add :end, :utc_datetime

      timestamps()
    end

  end
end
