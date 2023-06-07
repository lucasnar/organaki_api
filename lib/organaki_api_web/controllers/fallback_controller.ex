defmodule OrganakiApiWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use OrganakiApiWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: OrganakiApiWeb.ErrorJSON)
    |> render(:"404")
  end

  # Render changeset errors
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: OrganakiApiWeb.ChangesetJSON)
    |> render("error.json", %{changeset: changeset})
  end

  # 422 errors
  # Example: when passing a wrong param names to create a
  # producer.
  def call(conn, {:error, :unprocessable_entity}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: OrganakiApiWeb.ErrorJSON)
    |> render(:"422")
  end
end
