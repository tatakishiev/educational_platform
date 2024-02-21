defmodule EducationalPlatformWeb.LessonLiveTest do
  use EducationalPlatformWeb.ConnCase

  import Phoenix.LiveViewTest
  import EducationalPlatform.CoursesFixtures

  @create_attrs %{name: "some name", date: "2024-02-20"}
  @update_attrs %{name: "some updated name", date: "2024-02-21"}
  @invalid_attrs %{name: nil, date: nil}

  defp create_lesson(_) do
    lesson = lesson_fixture()
    %{lesson: lesson}
  end

  describe "Index" do
    setup [:create_lesson]

    test "lists all lesson", %{conn: conn, lesson: lesson} do
      {:ok, _index_live, html} = live(conn, ~p"/lesson")

      assert html =~ "Listing Lesson"
      assert html =~ lesson.name
    end

    test "saves new lesson", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/lesson")

      assert index_live |> element("a", "New lesson") |> render_click() =~
               "New lesson"

      assert_patch(index_live, ~p"/lesson/new")

      assert index_live
             |> form("#lesson-form", lesson: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#lesson-form", lesson: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/lesson")

      html = render(index_live)
      assert html =~ "lesson created successfully"
      assert html =~ "some name"
    end

    test "updates lesson in listing", %{conn: conn, lesson: lesson} do
      {:ok, index_live, _html} = live(conn, ~p"/lesson")

      assert index_live |> element("#lesson-#{lesson.id} a", "Edit") |> render_click() =~
               "Edit lesson"

      assert_patch(index_live, ~p"/lesson/#{lesson}/edit")

      assert index_live
             |> form("#lesson-form", lesson: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#lesson-form", lesson: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/lesson")

      html = render(index_live)
      assert html =~ "lesson updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes lesson in listing", %{conn: conn, lesson: lesson} do
      {:ok, index_live, _html} = live(conn, ~p"/lesson")

      assert index_live |> element("#lesson-#{lesson.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#lesson-#{lesson.id}")
    end
  end

  describe "Show" do
    setup [:create_lesson]

    test "displays lesson", %{conn: conn, lesson: lesson} do
      {:ok, _show_live, html} = live(conn, ~p"/lesson/#{lesson}")

      assert html =~ "Show lesson"
      assert html =~ lesson.name
    end

    test "updates lesson within modal", %{conn: conn, lesson: lesson} do
      {:ok, show_live, _html} = live(conn, ~p"/lesson/#{lesson}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit lesson"

      assert_patch(show_live, ~p"/lesson/#{lesson}/show/edit")

      assert show_live
             |> form("#lesson-form", lesson: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#lesson-form", lesson: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/lesson/#{lesson}")

      html = render(show_live)
      assert html =~ "lesson updated successfully"
      assert html =~ "some updated name"
    end
  end
end
