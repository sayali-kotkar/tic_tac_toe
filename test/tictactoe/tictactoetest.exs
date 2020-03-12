defmodule TicTacToeTest do
  use ExUnit.Case

  test "player can make a move" do
    TicTacToe.create_new_board(2)
    assert {:ok, _board} = TicTacToe.movenow(2, 0, 2, 2)
  end

  test "player 0 cannot make a move on already filled cell" do
    TicTacToe.create_new_board(45)
    {:ok, _board} = TicTacToe.movenow(45, 0, 2, 2)
    assert {:error, :cell_already_occupied, board} = TicTacToe.movenow(45, 0, 2, 2)
  end

  test "player 1 cannot make a move on already filled cell" do
    TicTacToe.create_new_board(56)
    {:ok, _board} = TicTacToe.movenow(56, 0, 1, 2)
    assert {:error, :cell_already_occupied, board} = TicTacToe.movenow(56, 0, 1, 2)
  end

  test "player cannot make a move outside the cell" do
    TicTacToe.create_new_board(13)
    assert {:error, :invalid_location, board} = TicTacToe.movenow(13, 0, 4, 2)
  end

  test "player 0 wins with the game with a horizontal line" do
    _board = TicTacToe.create_new_board(89)
    {:ok, _board} = TicTacToe.movenow(89, 0, 1, 1)
    {:ok, _board} = TicTacToe.movenow(89, 0, 1, 2)
    {:ok, board} = TicTacToe.movenow(89, 0, 1, 3)

    assert {:finished, {:won, :o}} = TicTacToe.game_status(board)
  end

  test "player 1 wins with the game with a diagonal line" do
    _board = TicTacToe.create_new_board(34)
    {:ok, _board} = TicTacToe.movenow(34, 1, 1, 1)
    {:ok, _board} = TicTacToe.movenow(34, 1, 2, 2)
    {:ok, board} = TicTacToe.movenow(34, 1, 3, 3)

    assert {:finished, {:won, :x}} = TicTacToe.game_status(board)
  end
end
