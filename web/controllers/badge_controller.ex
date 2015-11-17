defmodule OpenreevooWebsite.BadgeController do
  use OpenreevooWebsite.Web, :controller

  def show(conn, %{"project_name" => project_name}) do
    IO.puts System.cwd
    conn
    |> put_resp_content_type("image/jpeg")
    |> send_file(200, "web/static/assets/images/phoenix.png")
  end
end
