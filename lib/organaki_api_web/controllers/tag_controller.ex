defmodule OrganakiApiWeb.TagController do
  use OrganakiApiWeb, :controller

  alias OrganakiApi.Tags

  action_fallback OrganakiApiWeb.FallbackController

  def index(conn, _params) do
    tags = Tags.list_tags()

    render(conn, :index, tags: tags)
  end
end
