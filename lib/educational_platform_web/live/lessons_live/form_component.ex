defmodule EducationalPlatformWeb.LessonsLive.FormComponent do
  use EducationalPlatformWeb, :live_component

  alias EducationalPlatform.Courses

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage lessons records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="lessons-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:date]} type="date" label="Date" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Lessons</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{lessons: lessons} = assigns, socket) do
    changeset = Courses.change_lessons(lessons)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"lessons" => lessons_params}, socket) do
    changeset =
      socket.assigns.lessons
      |> Courses.change_lessons(lessons_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"lessons" => lessons_params}, socket) do
    save_lessons(socket, socket.assigns.action, lessons_params)
  end

  defp save_lessons(socket, :edit, lessons_params) do
    case Courses.update_lessons(socket.assigns.lessons, lessons_params) do
      {:ok, lessons} ->
        notify_parent({:saved, lessons})

        {:noreply,
         socket
         |> put_flash(:info, "Lessons updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_lessons(socket, :new, lessons_params) do
    case Courses.create_lessons(lessons_params) do
      {:ok, lessons} ->
        notify_parent({:saved, lessons})

        {:noreply,
         socket
         |> put_flash(:info, "Lessons created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
