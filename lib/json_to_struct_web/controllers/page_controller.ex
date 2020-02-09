defmodule JsonToStructWeb.PageController do
  use JsonToStructWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _) do
    LiveView.Controller.live_render(conn, JsonToStructWeb.ThermostatLive, session: %{})
  end
end
