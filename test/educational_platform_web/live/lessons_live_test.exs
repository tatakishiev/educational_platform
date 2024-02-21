defmodule EducationalPlatformWeb.LessonsLiveTest do
  use EducationalPlatformWeb.ConnCase

  import Phoenix.LiveViewTest
  import EducationalPlatform.CoursesFixtures

  @create_attrs %{name: "some name", date: "2024-02-20"}
  @update_attrs %{name: "some updated name", date: "2024-02-21"}
  @invalid_attrs %{name: nil, date: nil}

  defp create_lessons(_) do
    lessons = lessons_fixture()
    %{lessons: lessons}
  end

  describe "Index" do
    setup [:create_lessons]

    test "lists all lesson", %{conn: conn, lessons: lessons} do
      {:ok, _index_live, html} = live(conn, ~p"/lesson")

      assert html =~ "Listing Lesson"
      assert html =~ lessons.name
    end

    test "saves new lessons", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/lesson")

      assert index_live |> element("a", "New Lessons") |> render_click() =~
               "New Lessons"

      assert_patch(index_live, ~p"/lesson/new")

      assert index_live
             |> form("#lessons-form", lessons: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#lessons-form", lessons: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/lesson")

      html = render(index_live)
      assert html =~ "Lessons created successfully"
      assert html =~ "some name"
    end

    test "updates lessons in listing", %{conn: conn, lessons: lessons} do
      {:ok, index_live, _html} = live(conn, ~p"/lesson")

      assert index_live |> element("#lesson-#{lessons.id} a", "Edit") |> render_click() =~
               "Edit Lessons"

      assert_patch(index_live, ~p"/lesson/#{lessons}/edit")

      assert index_live
             |> form("#lessons-form", lessons: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#lessons-form", lessons: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/lesson")

      html = render(index_live)
      assert html =~ "Lessons updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes lessons in listing", %{conn: conn, lessons: lessons} do
      {:ok, index_live, _html} = live(conn, ~p"/lesson")

      assert index_live |> element("#lesson-#{lessons.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#lesson-#{lessons.id}")
    end
  end

  describe "Show" do
    setup [:create_lessons]

    test "displays lessons", %{conn: conn, lessons: lessons} do
      {:ok, _show_live, html} = live(conn, ~p"/lesson/#{lessons}")

      assert html =~ "Show Lessons"
      assert html =~ lessons.name
    end

    test "updates lessons within modal", %{conn: conn, lessons: lessons} do
      {:ok, show_live, _html} = live(conn, ~p"/lesson/#{lessons}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Lessons"

      assert_patch(show_live, ~p"/lesson/#{lessons}/show/edit")

      assert show_live
             |> form("#lessons-form", lessons: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#lessons-form", lessons: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/lesson/#{lessons}")

      html = render(show_live)
      assert html =~ "Lessons updated successfully"
      assert html =~ "some updated name"
    end
  end
end
