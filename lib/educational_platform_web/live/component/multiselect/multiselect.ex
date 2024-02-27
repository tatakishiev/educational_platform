defmodule EducationalPlatformWeb.MultiSelct do
  use EducationalPlatformWeb, :live_component

  alias PhoenixFiles.MultiSelct

  def render(assigns) do
    ~H"""
    <div></div>
    """
  end

  def update(%{id: id} = params, socket) do
    {:ok, assign(socket, :id, id)}
  end
end
