defmodule LemonadeStand.LemonController do
  use GenServer

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def increment do
    GenServer.call(__MODULE__, :increment)
  end

  def decrement do
    GenServer.call(__MODULE__, :decrement)
  end

  def expose do
    GenServer.call(__MODULE__, :expose)
  end

  # Server Callbacks

  @impl true
  def init(_opts) do
    {:ok, %{number_of: 0}}
  end

  @impl true
  def handle_call(:increment, _from, %{number_of: number_of} = state) do
    new_state = %{state | number_of: number_of + 1}
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_call(:decrement, _from, %{number_of: number_of} = state) do
    new_state = %{state | number_of: number_of - 1}
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_call(:expose, _from, state) do
    {:reply, state, state}
  end
end
