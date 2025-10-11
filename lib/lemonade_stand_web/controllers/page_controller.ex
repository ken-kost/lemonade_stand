defmodule LemonadeStandWeb.PageController do
  use LemonadeStandWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
