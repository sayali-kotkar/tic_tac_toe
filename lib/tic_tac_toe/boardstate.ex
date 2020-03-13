defmodule BoardState do
  use Agent

  @name {:global, __MODULE__}

  def start_link do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def start_link([]) do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def add(game_id, board) do
    Agent.update(@name, fn state ->
      Map.put(state, game_id, board)
    end)
  end

  def reset do
    Agent.update(@name, fn _state -> %{} end)
  end

  def get(game_id) do
    Agent.get(@name, fn state ->
      Map.get(state, game_id)
    end)
  end

  def getKeys() do
    Agent.get(@name, fn state ->
      Map.keys(state)
    end)
  end
end
