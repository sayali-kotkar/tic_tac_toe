defmodule TicTacToeWeb.TicTacToeController do
  use TicTacToeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def createGame(conn, _params) do
    game_id = :rand.uniform(5)
    json(conn, game_id)
  end

  def make_move(conn, %{"game_id" => game_id, "playerid" => playerid}) do
    json(conn, game_id)
  end
end
