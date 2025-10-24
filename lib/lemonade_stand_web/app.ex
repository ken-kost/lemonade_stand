defmodule LemonadeStandWeb.App do
  use Bonseki.App

  scene do
    controller(:lemons, LemonadeStand.LemonController)
    controller(:water, LemonadeStand.WaterController)
    controller(:sugar, LemonadeStand.SugarController)

    controller(:lemonades, LemonadeStand.LemonadeController,
      dependencies: [:lemons, :water, :sugar]
    )
  end
end
