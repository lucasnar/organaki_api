defmodule OrganakiApiWeb.ProducerController do
  use OrganakiApiWeb, :controller

  alias OrganakiApi.Producers
  alias OrganakiApi.Accounts.{Guardian, User}

  action_fallback OrganakiApiWeb.FallbackController

  def index(conn, _params) do
    producers = Producers.list_producers()
    render(conn, :index, producers: producers)
  end

  def create(conn, %{"producer" => producer_params}) do
    with {:ok, %User{is_producer: true} = producer} <- Producers.create_producer(producer_params) do
      {:ok, token, _claims} = Guardian.encode_and_sign(producer)

      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/producers/#{producer.id}")
      |> render(:show, producer: producer, token: token)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = producer} <- Producers.get_producer(id) do
      render(conn, :show, producer: producer)
    end
  end

  def update(conn, %{"id" => id, "producer" => producer_params}) do
    with :ok <- ensure_owner(conn, id),
         {:ok, producer} <- Producers.get_producer(id),
         {:ok, %User{} = producer} <- Producers.update_producer(producer, producer_params) do
      render(conn, :show, producer: producer)
    end
  end

  def delete(conn, %{"id" => id}) do
    with :ok <- ensure_owner(conn, id),
         {:ok, producer} <- Producers.get_producer(id),
         {:ok, %User{}} <- Producers.delete_producer(producer) do
      send_resp(conn, :no_content, "")
    end
  end

  # Only the user should be able to update/delete their account.
  # TODO: Maybe this could be a plug.
  defp ensure_owner(conn, id) do
    user = Guardian.Plug.current_resource(conn)

    if user.id == id do
      :ok
    else
      {:error, :unauthorized}
    end
  end
end
