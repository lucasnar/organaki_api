defmodule OrganakiApiWeb.SessionJSON do
  alias OrganakiApi.Accounts.User

  @doc """
  Renders a user and token.

  NOTE: This is unused to make front-end development easier
  due to the deadline we have.
  TODO: Make this return similarly to
  OrganakiApiWeb.ProducerJSON show with token, but not use the
  producer terminology.
  """
  def user_token(%{user: user, token: token}) do
    %{data: data(user, token)}
  end

  defp data(%User{} = user, token) do
    %{
      id: user.id,
      email: user.email,
      token: token
    }
  end
end
