defmodule OrganakiApiWeb.SessionController do
  use OrganakiApiWeb, :controller

  action_fallback OrganakiApiWeb.FallbackController

  alias OrganakiApi.{Accounts, Accounts.Guardian, Producers}

  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        user = Producers.preload_tags(user)

        # NOTE: see TODO at OrganakiApiWeb.ProducerJSON
        conn
        |> put_status(:ok)
        |> put_view(json: OrganakiApiWeb.ProducerJSON)
        |> render(:show, producer: user, token: token)

      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid credentials"})
    end
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> put_status(:ok)
    |> json(%{msg: "Logged out"})
  end
end
