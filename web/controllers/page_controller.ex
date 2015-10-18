defmodule PhoenixJokenAuth.PageController do
  use PhoenixJokenAuth.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
