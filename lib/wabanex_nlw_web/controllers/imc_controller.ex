defmodule WabanexNlwWeb.IMCController do
  use WabanexNlwWeb, :controller

  alias WabanexNlw.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_res(conn)
  end

  defp handle_res({:ok, result}, conn), do: render_res(conn, result, :ok)
  defp handle_res({:error, result}, conn), do: render_res(conn, result, :bad_request)

  defp render_res(conn, result, status) do
    conn
    |> put_status(status)
    |> json(%{result: result})
  end
end
