defmodule EducationalPlatform.CoursesTest do
  use EducationalPlatform.DataCase

  alias EducationalPlatform.Courses

  describe "class" do
    alias EducationalPlatform.Courses.Class

    import EducationalPlatform.CoursesFixtures

    @invalid_attrs %{name: nil, descriptio: nil}

    test "list_class/0 returns all class" do
      class = class_fixture()
      assert Courses.list_class() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Courses.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      valid_attrs = %{name: "some name", descriptio: "some descriptio"}

      assert {:ok, %Class{} = class} = Courses.create_class(valid_attrs)
      assert class.name == "some name"
      assert class.descriptio == "some descriptio"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      update_attrs = %{name: "some updated name", descriptio: "some updated descriptio"}

      assert {:ok, %Class{} = class} = Courses.update_class(class, update_attrs)
      assert class.name == "some updated name"
      assert class.descriptio == "some updated descriptio"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_class(class, @invalid_attrs)
      assert class == Courses.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Courses.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Courses.change_class(class)
    end
  end

  describe "class" do
    alias EducationalPlatform.Courses.Class

    import EducationalPlatform.CoursesFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_class/0 returns all class" do
      class = class_fixture()
      assert Courses.list_class() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Courses.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Class{} = class} = Courses.create_class(valid_attrs)
      assert class.name == "some name"
      assert class.description == "some description"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Class{} = class} = Courses.update_class(class, update_attrs)
      assert class.name == "some updated name"
      assert class.description == "some updated description"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_class(class, @invalid_attrs)
      assert class == Courses.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Courses.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Courses.change_class(class)
    end
  end
end
