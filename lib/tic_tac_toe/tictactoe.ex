defmodule TicTacToe do
  def create_new_board(game_id) do
    # creates map , key --> boardlocaton (Cell), value --> empty
    board = for(c <- cells(), into: %{}, do: {c, :empty})
    BoardState.add(game_id, board)
    {:ok, board}
  end

  def cells do
    # creates all valid cells
    for c <- 1..3, r <- 1..3, into: MapSet.new(), do: %Cell{row: r, col: c}
  end

  def values_vertical_lines(board) do
    [
      for({%{col: c, row: _}, v} <- board, c == 1, do: v),
      for({%{col: c, row: _}, v} <- board, c == 2, do: v),
      for({%{col: c, row: _}, v} <- board, c == 3, do: v)
    ]
  end

  def values_horizontal_lines(board) do
    [
      for({%{row: r, col: _}, v} <- board, r == 1, do: v),
      for({%{row: r, col: _}, v} <- board, r == 2, do: v),
      for({%{row: r, col: _}, v} <- board, r == 3, do: v)
    ]
  end

  def values_diagonal(board) do
    [
      for({%{row: r, col: c}, v} <- board, r == c, do: v),
      for({%{row: r, col: c}, v} <- board, r + c == 4, do: v)
    ]
  end

  def isWinner(board, player) do
    row_val = values_vertical_lines(board)
    col_val = values_horizontal_lines(board)
    diagonal_val = values_diagonal(board)
    Enum.any?(row_val ++ col_val ++ diagonal_val, &check(&1, player))
  end

  def check(line, player) do
    Enum.all?(line, &(&1 == player))
  end

  def game_status(board) do
    cond do
      isWinner(board, 1) ->
        {:finished, {:won, :x}}

      isWinner(board, 0) ->
        {:finished, {:won, :o}}

      true ->
        :playing
    end
  end

  def movenow(game_id, player_id, row, column) do
    make_move(
      game_id,
      BoardState.get(game_id),
      Cell.new(row, column),
      player_id
    )
  end

  # board format (set of maps , map --> (board_location, player_symbol_move))
  # [{%Cell{row:0 ,col: 0} => :empty}, %Cell{0,1}:empty,  %Square{0,2}:empty}]
  def make_move(game_id, board, cell_location, player) do
    case board[cell_location] do
      nil ->
        {:error, :invalid_location, board}

      0 ->
        {:error, :cell_already_occupied, board}

      1 ->
        {:error, :cell_already_occupied, board}

      :empty ->
        board = %{board | cell_location => player}
        BoardState.add(game_id, board)
        {:ok, board}
    end
  end
end
