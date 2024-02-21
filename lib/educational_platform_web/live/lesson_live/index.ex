defmodule EducationalPlatformWeb.LessonLive.Index do
  use EducationalPlatformWeb, :live_view

  alias EducationalPlatform.Courses
  alias EducationalPlatform.Courses.Lesson

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
    |> assign(:page_title, "Edit Lesson")
    |> assign(:lesson, Courses.get_lesson!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Lesson")
    |> assign(:lesson, %Lesson{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Lesson")
    |> assign(:lesson, nil)
  end

  @impl true
  def handle_info({EducationalPlatformWeb.LessonLive.FormComponent, {:saved, lesson}}, socket) do
    {:noreply, stream_insert(socket, :lesson, lesson)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    lesson = Courses.get_lesson!(id)
    {:ok, _} = Courses.delete_lesson(lesson)

    {:noreply, stream_delete(socket, :lesson, lesson)}
  end
end
