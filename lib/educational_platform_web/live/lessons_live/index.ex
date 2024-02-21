defmodule EducationalPlatformWeb.LessonsLive.Index do
  use EducationalPlatformWeb, :live_view

  alias EducationalPlatform.Courses
  alias EducationalPlatform.Courses.Lessons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :lesson, Courses.list_lesson())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Lessons")
    |> assign(:lessons, Courses.get_lessons!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Lessons")
    |> assign(:lessons, %Lessons{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Lesson")
    |> assign(:lessons, nil)
  end

  @impl true
  def handle_info({EducationalPlatformWeb.LessonsLive.FormComponent, {:saved, lessons}}, socket) do
    {:noreply, stream_insert(socket, :lesson, lessons)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    lessons = Courses.get_lessons!(id)
    {:ok, _} = Courses.delete_lessons(lessons)

    {:noreply, stream_delete(socket, :lesson, lessons)}
  end
end
