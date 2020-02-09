defmodule JsonToStructWeb.PageController do
  use JsonToStructWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
