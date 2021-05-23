defmodule LocoWeb.MoveController do
  use LocoWeb, :controller

  alias Loco.Moves
  alias Loco.Moves.Move

  def index(conn, _params) do
    moves = Moves.list_moves()
    render(conn, "index.html", moves: moves)
  end

  def new(conn, _params) do
    changeset = Moves.change_move(%Move{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"move" => move_params}) do
    case Moves.create_move(move_params) do
      {:ok, move} ->
        conn
        |> put_flash(:info, "Move created successfully.")
        |> redirect(to: Routes.move_path(conn, :show, move))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    move = Moves.get_move!(id)
    render(conn, "show.html", move: move)
  end

  def edit(conn, %{"id" => id}) do
    move = Moves.get_move!(id)
    changeset = Moves.change_move(move)
    render(conn, "edit.html", move: move, changeset: changeset)
  end

  def update(conn, %{"id" => id, "move" => move_params}) do
    move = Moves.get_move!(id)

    case Moves.update_move(move, move_params) do
      {:ok, move} ->
        conn
        |> put_flash(:info, "Move updated successfully.")
        |> redirect(to: Routes.move_path(conn, :show, move))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", move: move, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    move = Moves.get_move!(id)
    {:ok, _move} = Moves.delete_move(move)

    conn
    |> put_flash(:info, "Move deleted successfully.")
    |> redirect(to: Routes.move_path(conn, :index))
  end
end
