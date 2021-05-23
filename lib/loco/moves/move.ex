defmodule Loco.Moves.Move do
  use Ecto.Schema
  import Ecto.Changeset

  schema "moves" do
    field :destination, :string
    field :end, :utc_datetime
    field :name, :string
    field :start, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(move, attrs) do
    move
    |> cast(attrs, [:name, :destination, :start, :end])
    |> validate_required([:name, :destination, :start, :end])
  end
end
