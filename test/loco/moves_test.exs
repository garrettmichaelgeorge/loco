defmodule Loco.MovesTest do
  use Loco.DataCase

  alias Loco.Moves

  describe "moves" do
    alias Loco.Moves.Move

    @valid_attrs %{destination: "some destination", end: "2010-04-17T14:00:00Z", name: "some name", start: "2010-04-17T14:00:00Z"}
    @update_attrs %{destination: "some updated destination", end: "2011-05-18T15:01:01Z", name: "some updated name", start: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{destination: nil, end: nil, name: nil, start: nil}

    def move_fixture(attrs \\ %{}) do
      {:ok, move} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Moves.create_move()

      move
    end

    test "list_moves/0 returns all moves" do
      move = move_fixture()
      assert Moves.list_moves() == [move]
    end

    test "get_move!/1 returns the move with given id" do
      move = move_fixture()
      assert Moves.get_move!(move.id) == move
    end

    test "create_move/1 with valid data creates a move" do
      assert {:ok, %Move{} = move} = Moves.create_move(@valid_attrs)
      assert move.destination == "some destination"
      assert move.end == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert move.name == "some name"
      assert move.start == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_move/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Moves.create_move(@invalid_attrs)
    end

    test "update_move/2 with valid data updates the move" do
      move = move_fixture()
      assert {:ok, %Move{} = move} = Moves.update_move(move, @update_attrs)
      assert move.destination == "some updated destination"
      assert move.end == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert move.name == "some updated name"
      assert move.start == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_move/2 with invalid data returns error changeset" do
      move = move_fixture()
      assert {:error, %Ecto.Changeset{}} = Moves.update_move(move, @invalid_attrs)
      assert move == Moves.get_move!(move.id)
    end

    test "delete_move/1 deletes the move" do
      move = move_fixture()
      assert {:ok, %Move{}} = Moves.delete_move(move)
      assert_raise Ecto.NoResultsError, fn -> Moves.get_move!(move.id) end
    end

    test "change_move/1 returns a move changeset" do
      move = move_fixture()
      assert %Ecto.Changeset{} = Moves.change_move(move)
    end
  end
end
