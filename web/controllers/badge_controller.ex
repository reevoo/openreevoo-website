defmodule OpenreevooWebsite.BadgeController do
  use OpenreevooWebsite.Web, :controller

  def show(conn, %{"project_name" => project_name}) do
    conn
    |> put_layout(false)
    |> put_resp_content_type("image/svg+xml")
    |> render("badge.html", %{ rating: 5.0 })
  end
end
