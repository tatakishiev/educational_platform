defmodule EducationalPlatformWeb.ClassControllerTest do
  use EducationalPlatformWeb.ConnCase

  import EducationalPlatform.CoursesFixtures

  @create_attrs %{name: "some name", description: "some description"}
  @update_attrs %{name: "some updated name", description: "some updated description"}
  @invalid_attrs %{name: nil, description: nil}

  describe "index" do
    test "lists all class", %{conn: conn} do
      conn = get(conn, ~p"/class")
      assert html_response(conn, 200) =~ "Listing Class"
    end
  end

  describe "new class" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/class/new")
      assert html_response(conn, 200) =~ "New Class"
    end
  end

  describe "create class" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/class", class: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/class/#{id}"

      conn = get(conn, ~p"/class/#{id}")
      assert html_response(conn, 200) =~ "Class #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/class", class: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Class"
    end
  end

  describe "edit class" do
    setup [:create_class]

    test "renders form for editing chosen class", %{conn: conn, class: class} do
      conn = get(conn, ~p"/class/#{class}/edit")
      assert html_response(conn, 200) =~ "Edit Class"
    end
  end

  describe "update class" do
    setup [:create_class]

    test "redirects when data is valid", %{conn: conn, class: class} do
      conn = put(conn, ~p"/class/#{class}", class: @update_attrs)
      assert redirected_to(conn) == ~p"/class/#{class}"

      conn = get(conn, ~p"/class/#{class}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, class: class} do
      conn = put(conn, ~p"/class/#{class}", class: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Class"
    end
  end

  describe "delete class" do
    setup [:create_class]

    test "deletes chosen class", %{conn: conn, class: class} do
      conn = delete(conn, ~p"/class/#{class}")
      assert redirected_to(conn) == ~p"/class"

      assert_error_sent 404, fn ->
        get(conn, ~p"/class/#{class}")
      end
    end
  end

  defp create_class(_) do
    class = class_fixture()
    %{class: class}
  end
end
