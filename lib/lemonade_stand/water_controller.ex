defmodule LemonadeStand.WaterController do
  use Bonseki.Controller, events: [:add, :remove]

  def init(_params) do
    %{count: 0}
  end

  def add(state, _params) do
    %{state | count: state.count + 1}
  end

  def remove(state, _params) do
    %{state | count: max(0, state.count - 1)}
  end

  def expose(state, _dependencies) do
    %{count: state.count, has_water: state.count > 0}
  end
end
