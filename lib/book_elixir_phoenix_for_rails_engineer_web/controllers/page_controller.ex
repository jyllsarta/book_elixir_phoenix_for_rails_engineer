defmodule BookElixirPhoenixForRailsEngineerWeb.PageController do
  use BookElixirPhoenixForRailsEngineerWeb, :controller

  def index(conn, _params) do
    posts = BookElixirPhoenixForRailsEngineer.Posts.list_posts()
    render(conn, "index.html", posts: posts)
  end
end
