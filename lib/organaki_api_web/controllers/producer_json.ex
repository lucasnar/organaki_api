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
  def show(%{producer: producer}) do
    %{producer: render_producer(producer)}
  end

  defp render_producer(%User{} = producer) do
    %{
      id: producer.id
    }
  end
end
