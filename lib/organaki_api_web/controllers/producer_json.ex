defmodule OrganakiApiWeb.ProducerJSON do
  alias OrganakiApi.Accounts.User

  @doc """
  Renders a list of producers.
  """
  def index(%{producers: producers}) do
    %{producers: for(producer <- producers, do: render_producer(producer))}
  end

  @doc """
  Renders a single producer.
  """
  def show(%{producer: producer, token: token}) do
    %{producer: render_producer(producer, token)}
  end

  def show(%{producer: producer}) do
    %{producer: render_producer(producer)}
  end

  defp render_producer(%User{} = producer, token) do
    producer
    |> render_producer()
    |> Map.put(:token, token)
  end

  defp render_producer(%User{} = producer) do
    %{
      id: producer.id,
      name: producer.name,
      email: producer.email,
      visible_producer: producer.visible_producer,
      short_description: producer.short_description,
      address: producer.address,
      contact: producer.contact,
      opening_hours: producer.opening_hours,
      advertisement: producer.advertisement,
      organic_seal: producer.organic_seal,
      seal_number: producer.seal_number,
      tags: for(tag <- producer.tags, do: tag.name)
    }
  end
end
