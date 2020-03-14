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
    game_id = String.to_integer(game_id)

    case TicTacToe.movenow(game_id, player_id, row, column) do
      {:ok, board} ->
        # json(conn, board)
        conn |> json(format_respone(:move, game_id, board))

      {:error, msg, board} ->
        conn |> json(format_respone(:error, game_id, msg, board))

      {:finished, msg, board} ->
        conn |> json(format_respone(:finished, game_id, msg, board))
    end
  end

  defp format_respone(:finished, game_id, msg, board) do
    %{game_id: game_id, status: "success", message: msg, board: board}
  end

  defp format_respone(:create, game_id, board) do
    %{game_id: game_id, status: "success", board: board}
  end

  defp format_respone(:move, game_id, board) do
    %{game_id: game_id, status: "success", board: board}
  end

  defp format_respone(:error, game_id, msg, board) do
    %{game_id: game_id, status: "error occured", message: msg, board: board}
  end
end
