defmodule LemonadeStand.LemonadeController do
  use Bonseki.Controller

  def init(_params) do
    %{total: 0}
  end



  def expose(_state, dependencies) do
    %{lemons: lemons, water: water, sugar: sugar} = dependencies

    total = lemons.count + water.count + sugar.count

    %{total: total}
  end
end
