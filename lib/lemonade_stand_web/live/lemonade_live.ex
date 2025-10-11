defmodule LemonadeStandWeb.LemonadeLive do
  use LemonadeStandWeb, :live_view

  on_mount {LemonadeStandWeb.LiveUserAuth, :current_user}

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       number_of_lemons: 0,
       number_of_water: 0,
       number_of_sugar: 0,
       number_of_cups: 0
     )}
  end

  def handle_event("increment_lemons", _params, socket) do
    {:noreply, assign(socket, number_of_lemons: socket.assigns.number_of_lemons + 1)}
  end

  def handle_event("decrement_lemons", _params, socket) do
    {:noreply, assign(socket, number_of_lemons: socket.assigns.number_of_lemons - 1)}
  end

  def handle_event("increment_water", _params, socket) do
    {:noreply, assign(socket, number_of_water: socket.assigns.number_of_water + 1)}
  end

  def handle_event("decrement_water", _params, socket) do
    {:noreply, assign(socket, number_of_water: socket.assigns.number_of_water - 1)}
  end

  def handle_event("increment_sugar", _params, socket) do
    {:noreply, assign(socket, number_of_sugar: socket.assigns.number_of_sugar + 1)}
  end

  def handle_event("decrement_sugar", _params, socket) do
    {:noreply, assign(socket, number_of_sugar: socket.assigns.number_of_sugar - 1)}
  end

  def handle_event("increment_cups", _params, socket) do
    {:noreply, assign(socket, number_of_cups: socket.assigns.number_of_cups + 1)}
  end

  def handle_event("decrement_cups", _params, socket) do
    {:noreply, assign(socket, number_of_cups: socket.assigns.number_of_cups - 1)}
  end

  defp calculate_lemonades(assigns) do
    max_from_lemons = assigns.number_of_lemons
    max_from_water = div(assigns.number_of_water, 2)
    max_from_sugar = assigns.number_of_sugar
    max_from_cups = assigns.number_of_cups

    Enum.min([max_from_lemons, max_from_water, max_from_sugar, max_from_cups])
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 rounded-lg flex items-center justify-center p-4">
        <div class="bg-white rounded-2xl shadow-2xl p-8 max-w-4xl w-full">
          <div class="text-center mb-8">
            <h1 class="text-4xl font-bold text-gray-600 mb-2">🍋 Lemonade Stand</h1>
            <p class="text-gray-600">Manage your ingredients</p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <%!-- Lemons Counter --%>
            <div class="bg-white border-2 border-yellow-200 rounded-xl p-6">
              <div class="text-center mb-4">
                <div class="text-5xl mb-2">🍋</div>
                <div class="text-4xl font-bold text-yellow-600 mb-2">
                  {@number_of_lemons}
                </div>
                <div class="text-sm text-gray-600 uppercase tracking-wide font-semibold">
                  Lemons
                </div>
              </div>
              <div class="flex gap-2">
                <button
                  phx-click="decrement_lemons"
                  class={[
                    "flex-1 bg-red-500 hover:bg-red-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-red-400"
                  ]}
                >
                  <span class="text-xl">−</span>
                </button>
                <button
                  phx-click="increment_lemons"
                  class={[
                    "flex-1 bg-green-500 hover:bg-green-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-green-400"
                  ]}
                >
                  <span class="text-xl">+</span>
                </button>
              </div>
            </div>

            <%!-- Water Counter --%>
            <div class="bg-white border-2 border-blue-200 rounded-xl p-6">
              <div class="text-center mb-4">
                <div class="text-5xl mb-2">💧</div>
                <div class="text-4xl font-bold text-blue-600 mb-2">
                  {@number_of_water}
                </div>
                <div class="text-sm text-gray-600 uppercase tracking-wide font-semibold">
                  Water
                </div>
              </div>
              <div class="flex gap-2">
                <button
                  phx-click="decrement_water"
                  class={[
                    "flex-1 bg-red-500 hover:bg-red-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-red-400"
                  ]}
                >
                  <span class="text-xl">−</span>
                </button>
                <button
                  phx-click="increment_water"
                  class={[
                    "flex-1 bg-green-500 hover:bg-green-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-green-400"
                  ]}
                >
                  <span class="text-xl">+</span>
                </button>
              </div>
            </div>

            <%!-- Sugar Counter --%>
            <div class="bg-white border-2 border-pink-200 rounded-xl p-6">
              <div class="text-center mb-4">
                <div class="text-5xl mb-2">🍬</div>
                <div class="text-4xl font-bold text-pink-600 mb-2">
                  {@number_of_sugar}
                </div>
                <div class="text-sm text-gray-600 uppercase tracking-wide font-semibold">
                  Sugar
                </div>
              </div>
              <div class="flex gap-2">
                <button
                  phx-click="decrement_sugar"
                  class={[
                    "flex-1 bg-red-500 hover:bg-red-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-red-400"
                  ]}
                >
                  <span class="text-xl">−</span>
                </button>
                <button
                  phx-click="increment_sugar"
                  class={[
                    "flex-1 bg-green-500 hover:bg-green-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-green-400"
                  ]}
                >
                  <span class="text-xl">+</span>
                </button>
              </div>
            </div>

            <%!-- Cups Counter --%>
            <div class="bg-white border-2 border-purple-200 rounded-xl p-6">
              <div class="text-center mb-4">
                <div class="text-5xl mb-2">🥤</div>
                <div class="text-4xl font-bold text-purple-600 mb-2">
                  {@number_of_cups}
                </div>
                <div class="text-sm text-gray-600 uppercase tracking-wide font-semibold">
                  Cups
                </div>
              </div>
              <div class="flex gap-2">
                <button
                  phx-click="decrement_cups"
                  class={[
                    "flex-1 bg-red-500 hover:bg-red-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-red-400"
                  ]}
                >
                  <span class="text-xl">−</span>
                </button>
                <button
                  phx-click="increment_cups"
                  class={[
                    "flex-1 bg-green-500 hover:bg-green-600 text-white font-semibold",
                    "py-3 px-4 rounded-lg shadow hover:shadow-lg",
                    "transition-all duration-200 transform hover:scale-105",
                    "active:scale-95 focus:outline-none focus:ring-2 focus:ring-green-400"
                  ]}
                >
                  <span class="text-xl">+</span>
                </button>
              </div>
            </div>
          </div>

          <div class="mt-8 bg-gradient-to-r from-yellow-400 to-orange-400 rounded-xl p-6 shadow-lg">
            <div class="text-center">
              <div class="text-white text-sm uppercase tracking-wide font-semibold mb-2">
                You can make
              </div>
              <div class="text-6xl font-bold text-white mb-2">
                {calculate_lemonades(assigns)}
              </div>
              <div class="text-white text-lg font-semibold mb-4">
                {if calculate_lemonades(assigns) == 1, do: "Lemonade", else: "Lemonades"}
              </div>
              <div class="text-yellow-100 text-xs">
                Recipe: 1 lemon + 2 water + 1 sugar + 1 cup = 1 lemonade
              </div>
            </div>
          </div>

          <div class="mt-6 text-center text-sm text-gray-500">
            <p>Manage all your lemonade stand ingredients</p>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
