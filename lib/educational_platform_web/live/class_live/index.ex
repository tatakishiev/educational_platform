defmodule EducationalPlatformWeb.ClassLive.Index do
  use EducationalPlatformWeb, :live_view

  alias EducationalPlatform.Courses
  alias EducationalPlatform.Courses.Class

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :class_collection, Courses.list_class())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Class")
    |> assign(:class, Courses.get_class!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Class")
    |> assign(:class, %Class{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Class")
    |> assign(:class, nil)
  end

  @impl true
  def handle_info({EducationalPlatformWeb.ClassLive.FormComponent, {:saved, class}}, socket) do
    {:noreply, stream_insert(socket, :class_collection, class)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    class = Courses.get_class!(id)
    {:ok, _} = Courses.delete_class(class)

    {:noreply, stream_delete(socket, :class_collection, class)}
  end
end
