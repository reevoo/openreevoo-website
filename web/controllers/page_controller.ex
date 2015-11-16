defmodule OpenreevooWebsite.PageController do
  use OpenreevooWebsite.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
