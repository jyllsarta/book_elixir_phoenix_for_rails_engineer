defmodule BookElixirPhoenixForRailsEngineerWeb.PageController do
  use BookElixirPhoenixForRailsEngineerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
