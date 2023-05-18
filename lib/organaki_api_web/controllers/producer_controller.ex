defmodule OrganakiApiWeb.ProducerController do
  use OrganakiApiWeb, :controller

  alias OrganakiApi.Producers
  alias OrganakiApi.Accounts.User

  action_fallback OrganakiApiWeb.FallbackController

  def index(conn, _params) do
    producers = Producers.list_producers()
    render(conn, :index, producers: producers)
  end

  def create(conn, %{"producer" => producer_params}) do
    with {:ok, %User{is_producer: true} = producer} <- Producers.create_producer(producer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/producers/#{producer.id}")
      |> render(:show, producer: producer)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = producer} <- Producers.get_producer(id) do
      render(conn, :show, producer: producer)
    end
  end

  def update(conn, %{"id" => id, "producer" => producer_params}) do
    with {:ok, producer} <- Producers.get_producer(id),
         {:ok, %User{} = producer} <- Producers.update_producer(producer, producer_params) do
      render(conn, :show, producer: producer)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, producer} <- Producers.get_producer(id),
         {:ok, %User{}} <- Producers.delete_producer(producer) do
      send_resp(conn, :no_content, "")
    end
  end
end
