defmodule EducationalPlatformWeb.ClassLiveTest do
  use EducationalPlatformWeb.ConnCase

  import Phoenix.LiveViewTest
  import EducationalPlatform.CoursesFixtures

  @create_attrs %{name: "some name", date: "2024-02-20", description: "some description"}
  @update_attrs %{name: "some updated name", date: "2024-02-21", description: "some updated description"}
  @invalid_attrs %{name: nil, date: nil, description: nil}

  defp create_class(_) do
    class = class_fixture()
    %{class: class}
  end

  describe "Index" do
    setup [:create_class]

    test "lists all class", %{conn: conn, class: class} do
      {:ok, _index_live, html} = live(conn, ~p"/class")

      assert html =~ "Listing Class"
      assert html =~ class.name
    end

    test "saves new class", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/class")

      assert index_live |> element("a", "New Class") |> render_click() =~
               "New Class"

      assert_patch(index_live, ~p"/class/new")

      assert index_live
             |> form("#class-form", class: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#class-form", class: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/class")

      html = render(index_live)
      assert html =~ "Class created successfully"
      assert html =~ "some name"
    end

    test "updates class in listing", %{conn: conn, class: class} do
      {:ok, index_live, _html} = live(conn, ~p"/class")

      assert index_live |> element("#class-#{class.id} a", "Edit") |> render_click() =~
               "Edit Class"

      assert_patch(index_live, ~p"/class/#{class}/edit")

      assert index_live
             |> form("#class-form", class: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#class-form", class: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/class")

      html = render(index_live)
      assert html =~ "Class updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes class in listing", %{conn: conn, class: class} do
      {:ok, index_live, _html} = live(conn, ~p"/class")

      assert index_live |> element("#class-#{class.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#class-#{class.id}")
    end
  end

  describe "Show" do
    setup [:create_class]

    test "displays class", %{conn: conn, class: class} do
      {:ok, _show_live, html} = live(conn, ~p"/class/#{class}")

      assert html =~ "Show Class"
      assert html =~ class.name
    end

    test "updates class within modal", %{conn: conn, class: class} do
      {:ok, show_live, _html} = live(conn, ~p"/class/#{class}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Class"

      assert_patch(show_live, ~p"/class/#{class}/show/edit")

      assert show_live
             |> form("#class-form", class: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#class-form", class: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/class/#{class}")

      html = render(show_live)
      assert html =~ "Class updated successfully"
      assert html =~ "some updated name"
    end
  end
end
