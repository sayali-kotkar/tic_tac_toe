defmodule TicTacToeTest do
  use ExUnit.Case

  doctest TicTacToe

  test "player can make a move" do
    board = TicTacToe.create_new_board()
    assert {:ok, _board} = TicTacToe.make_move(board, Cell.new(2, 2), 0)
  end

  test "player 0 cannot make a move on already filled cell" do
    board = TicTacToe.create_new_board()
    {:ok, board} = TicTacToe.make_move(board, Cell.new(2, 2), 0)
    assert {:error, :cell_already_occupied} = TicTacToe.make_move(board, Cell.new(2, 2), 0)
  end

  test "player 1 cannot make a move on already filled cell" do
    board = TicTacToe.create_new_board()
    {:ok, board} = TicTacToe.make_move(board, Cell.new(2, 2), 1)
    assert {:error, :cell_already_occupied} = TicTacToe.make_move(board, Cell.new(2, 2), 1)
  end

  test "player cannot make a move outside the cell" do
    board = TicTacToe.create_new_board()
    assert {:error, :invalid_location} = TicTacToe.make_move(board, Cell.new(2, 4), 0)
  end

  test "player 0 wins with the game with a horizontal line" do
    board = TicTacToe.create_new_board()
    {:ok, board} = TicTacToe.make_move(board, Cell.new(1, 1), 0)
    {:ok, board} = TicTacToe.make_move(board, Cell.new(1, 2), 0)
    {:ok, board} = TicTacToe.make_move(board, Cell.new(1, 3), 0)

    assert {:finished, {:won, :o}} = TicTacToe.game_status(board)
  end

  test "player 1 wins with the game with a diagonal line" do
    board = TicTacToe.create_new_board()
    {:ok, board} = TicTacToe.make_move(board, Cell.new(1, 1), 1)
    {:ok, board} = TicTacToe.make_move(board, Cell.new(2, 2), 1)
    {:ok, board} = TicTacToe.make_move(board, Cell.new(3, 3), 1)

    assert {:finished, {:won, :x}} = TicTacToe.game_status(board)
  end
end
