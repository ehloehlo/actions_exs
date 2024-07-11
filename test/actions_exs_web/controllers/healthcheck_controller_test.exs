defmodule ActionsExsWeb.HealthcheckControllerTest do
  use ActionsExsWeb.ConnCase, async: true

  test "GET /api/healthcheck", %{conn: conn} do
    conn = get(conn, ~p"/api/healthcheck")

    assert json_response(conn, 200) == %{"success" => true}
  end

  test "GET /api/healthcheck?db=1", %{conn: conn} do
    conn = get(conn, ~p"/api/healthcheck?db=1")

    assert json_response(conn, 200) == %{"click" => 1}
  end
end
