defmodule EducationalPlatformWeb.ClassController do
  use EducationalPlatformWeb, :controller

  alias EducationalPlatform.Courses
  alias EducationalPlatform.Courses.Class

  def index(conn, _params) do
    class = Courses.list_class()
    render(conn, :index, class_collection: class)
  end

  def new(conn, _params) do
    changeset = Courses.change_class(%Class{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"class" => class_params}) do
    case Courses.create_class(class_params) do
      {:ok, class} ->
        conn
        |> put_flash(:info, "Class created successfully.")
        |> redirect(to: ~p"/class/#{class}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    class = Courses.get_class!(id)
    render(conn, :show, class: class)
  end

  def edit(conn, %{"id" => id}) do
    class = Courses.get_class!(id)
    changeset = Courses.change_class(class)
    render(conn, :edit, class: class, changeset: changeset)
  end

  def update(conn, %{"id" => id, "class" => class_params}) do
    class = Courses.get_class!(id)

    case Courses.update_class(class, class_params) do
      {:ok, class} ->
        conn
        |> put_flash(:info, "Class updated successfully.")
        |> redirect(to: ~p"/class/#{class}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, class: class, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    class = Courses.get_class!(id)
    {:ok, _class} = Courses.delete_class(class)

    conn
    |> put_flash(:info, "Class deleted successfully.")
    |> redirect(to: ~p"/class")
  end
end
