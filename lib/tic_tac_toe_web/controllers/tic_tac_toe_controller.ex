defmodule TicTacToeWeb.TicTacToeController do
  use TicTacToeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def createGame(conn, _params) do
    game_id = :rand.uniform(75)

    case TicTacToe.create_new_board(game_id) do
      {:ok, board} ->
        conn |> json(format_respone(:create, game_id, board))

      true ->
        json(conn, :error_accured)
        # json(conn, game_id)
    end
  end

  def move(conn, %{
        "game_id" => game_id,
        "player_id" => player_id,
        "row" => row,
        "column" => column
      }) do
    case TicTacToe.movenow(game_id, player_id, row, column) do
      {:ok, board} ->
        # json(conn, board)
        conn |> json(format_respone(:move, game_id, board))

      {_, _, board} ->
        conn |> json(format_respone(:error, game_id, board))
    end
  end

  defp format_respone(:create, game_id, board) do
    %{game_id: game_id, msg: "success", board: board}
  end

  defp format_respone(:move, game_id, board) do
    %{game_id: game_id, msg: "success", board: board}
  end

  defp format_respone(:error, game_id, board) do
    %{error_message: "error occured", game_id: game_id, board: board}
  end
end
