defmodule LocoWeb.PageController do
  use LocoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
