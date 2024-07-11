defmodule ActionsExsWeb.HealthCheckController do
  use ActionsExsWeb, :controller

  alias ActionsExs.System

  def healthcheck(conn, %{"db" => "1"}) do
    cnt =
      System.get_counter()
      |> System.update_counter()

    json(conn, %{click: cnt.click})
  end

  def healthcheck(conn, _params) do
    json(conn, %{success: true})
  end
end
