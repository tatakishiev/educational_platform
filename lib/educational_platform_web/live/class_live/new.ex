defmodule EducationalPlatformWeb.ClassLive.NewClass do
  alias EducationalPlatform.Accounts
  alias EducationalPlatform.Courses
  use EducationalPlatformWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="grow text-2xl font-bold">Create New Class</h1>
    <.form class="mb-6" for={@form} phx-submit="submit">
      <div>
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:date]} type="date" label="Date" />
        <.input field={@form[:user_id]} type="select" options={@users} label="User" />
        <.input field={@form[:lessons_ids]} type="select" options={@all_lessons} label="Lessons" />
      </div>
      <div style="padding-top:20px">
        <button class="bg-black border border-black hover:bg-gray-700 text-white font-hold py-2 px-3 rounded-md">
          Save
        </button>
      </div>
    </.form>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    changeset = Courses.Class.changeset(%Courses.Class{})
    users = Enum.map(Accounts.all_users(), &{&1.email, &1.id})
    all_lessons = Enum.map(Courses.list_lesson(), &{&1.name, &1.id})

    socket =
      socket
      |> assign(:form, to_form(changeset))
      |> assign(:users, users)
      |> assign(:all_lessons, all_lessons)

    {:ok, socket}
  end

  @impl true
  def handle_event("submit", %{"class" => class_params}, socket) do
    case Courses.create_class(class_params) do
      {:ok, _class} ->
        socket =
          socket
          |> put_flash(:info, "Class successfully created")
          |> push_navigate(to: ~p"/class")

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> assign(:form, to_form(changeset))

        {:noreply, socket}
    end
  end
end
