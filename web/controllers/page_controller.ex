defmodule OpenreevooWebsite.PageController do
  use OpenreevooWebsite.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def project(conn, %{"project_name" => project_name}) do
    render conn, "project.html", %{
      project_name: project_name
    }
  end
end
