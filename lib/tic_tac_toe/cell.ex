defmodule Cell do
  @enforce_keys [:row, :col]
  defstruct [:row, :col]

  def new(row, col) when row in 1..3 and col in 1..3 do
    # creates cell
    %Cell{row: row, col: col}
  end

  def new(_row, _col) do
    {:error, :invalid_cell}
  end
end
