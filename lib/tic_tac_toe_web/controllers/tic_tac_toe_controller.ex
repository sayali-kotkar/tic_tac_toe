defmodule TicTacToeWeb.TicTacToeController do
  use TicTacToeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def createGame(conn, params) do
    game_id = :rand.uniform(5)

    case TicTacToe.create_new_board() do
      {:ok, board} ->
        conn |> json(format_respone(:create, game_id, board))

      true ->
        json(conn, :error_accured)
        # json(conn, game_id)
    end
  end

  def move(conn, %{
        "game_id" => game_id,
        "playerid" => playerid,
        "move" => %{"row" => row, "column" => column}
      }) do
    {:ok, move} = GameEngine.Game.move(:game, game_id, %{row: row, column: column})

    conn
    |> json(handle_response(:move, game_id, move))
  end

  defp format_respone(:create, game_id, board) do
    %{game_id: game_id, board: board}
  end
end
