defmodule EducationalPlatformWeb.ClassLive.Index do
  use EducationalPlatformWeb, :live_view

  alias EducationalPlatform.Courses

  @impl true
  def mount(_params, _session, socket) do
    IO.inspect(Courses.list_class())
    {:ok, stream(socket, :class_collection, Courses.list_class())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Class")
    |> assign(:class, nil)
  end

  @impl true
  def handle_info({EducationalPlatformWeb.ClassLive.NewClass, {:saved, class}}, socket) do
    {:noreply, stream_insert(socket, :class_collection, class)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    class = Courses.get_class!(id)
    {:ok, _} = Courses.delete_class(class)

    {:noreply, stream_delete(socket, :class_collection, class)}
  end

  defp user_email(user) do
    if user == nil do
      ""
    else
      user.email
    end
  end
end
