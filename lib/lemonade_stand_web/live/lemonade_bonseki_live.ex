defmodule LemonadeStandWeb.LemonadeBonsekiLive do
  use Bonseki.UI, app: LemonadeStandWeb.App

  def init(params) do
    subscribe(params, %{
      lemons: LemonadeStand.LemonController,
      water: LemonadeStand.WaterController,
      sugar: LemonadeStand.SugarController,
      lemonades: LemonadeStand.LemonadeController
    })
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Lemonade Stand {@lemons.count}</h1>
      <button phx-click={@lemons.add}>Increment Lemons</button>
      <button phx-click={@lemons.remove}>Decrement Lemons</button>
      <h1>Lemonade Stand {@water.count}</h1>
      <button phx-click={@water.add}>Increment Water</button>
      <button phx-click={@water.remove}>Decrement Water</button>
      <h1>Lemonade Stand {@lemonades.total}</h1>
    </div>
    """
  end
end
