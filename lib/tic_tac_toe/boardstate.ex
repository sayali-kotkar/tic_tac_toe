defmodule BoardState do
  use Agent

  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add(game_id, board) do
    Agent.update(__MODULE__, fn state ->
      Map.put(state, game_id, board)
    end)
  end

  def reset do
    Agent.update(__MODULE__, fn _state -> %{} end)
  end

  def get(game_id) do
    Agent.get(__MODULE__, fn state ->
      Map.get(state, game_id)
    end)
  end

  def getKeys() do
    Agent.get(__MODULE__, fn state ->
      Map.keys(state)
    end)
  end

  def name() do
    Agent.agent()
  end
end
