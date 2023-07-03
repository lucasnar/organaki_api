defmodule OrganakiApiWeb.TagJSON do
  alias OrganakiApi.Tags.Tag

  @doc """
  Renders a list of tags.
  """
  def index(%{tags: tags}) do
    %{tags: for(tag <- tags, do: render_tag(tag))}
  end

  defp render_tag(%Tag{} = tag) do
    %{
      name: tag.name
    }
  end
end
