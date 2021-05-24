defmodule Loco.Repo.Migrations.CreateBoxes do
  use Ecto.Migration

  def change do
    create table(:boxes) do
      add :notes, :string
      add :move_id, references(:moves, on_delete: :nothing)

      timestamps()
    end

    create index(:boxes, [:move_id])
  end
end
