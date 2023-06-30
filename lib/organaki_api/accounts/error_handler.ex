defmodule OrganakiApi.Accounts.ErrorHandler do
  import Plug.Conn

  use OrganakiApiWeb, :controller

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {_type, _reason}, _opts) do
    conn
    |> put_status(:unauthorized)
    |> put_view(json: OrganakiApiWeb.ErrorJSON)
    |> render(:"401")
  end
end
