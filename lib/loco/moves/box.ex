defmodule Loco.Moves.Box do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boxes" do
    field :notes, :string
    field :move_id, :id

    timestamps()
  end

  @doc false
  def changeset(box, attrs) do
    box
    |> cast(attrs, [:notes])
    |> validate_required([:notes])
  end
end
