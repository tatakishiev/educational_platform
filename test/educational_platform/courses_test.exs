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

  describe "lesson" do
    alias EducationalPlatform.Courses.lesson

    import EducationalPlatform.CoursesFixtures

    @invalid_attrs %{name: nil, date: nil}

    test "list_lesson/0 returns all lesson" do
      lesson = lesson_fixture()
      assert Courses.list_lesson() == [lesson]
    end

    test "get_lesson!/1 returns the lesson with given id" do
      lesson = lesson_fixture()
      assert Courses.get_lesson!(lesson.id) == lesson
    end

    test "create_lesson/1 with valid data creates a lesson" do
      valid_attrs = %{name: "some name", date: ~D[2024-02-20]}

      assert {:ok, %lesson{} = lesson} = Courses.create_lesson(valid_attrs)
      assert lesson.name == "some name"
      assert lesson.date == ~D[2024-02-20]
    end

    test "create_lesson/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_lesson(@invalid_attrs)
    end

    test "update_lesson/2 with valid data updates the lesson" do
      lesson = lesson_fixture()
      update_attrs = %{name: "some updated name", date: ~D[2024-02-21]}

      assert {:ok, %lesson{} = lesson} = Courses.update_lesson(lesson, update_attrs)
      assert lesson.name == "some updated name"
      assert lesson.date == ~D[2024-02-21]
    end

    test "update_lesson/2 with invalid data returns error changeset" do
      lesson = lesson_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_lesson(lesson, @invalid_attrs)
      assert lesson == Courses.get_lesson!(lesson.id)
    end

    test "delete_lesson/1 deletes the lesson" do
      lesson = lesson_fixture()
      assert {:ok, %lesson{}} = Courses.delete_lesson(lesson)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_lesson!(lesson.id) end
    end

    test "change_lesson/1 returns a lesson changeset" do
      lesson = lesson_fixture()
      assert %Ecto.Changeset{} = Courses.change_lesson(lesson)
    end
  end

  describe "class" do
    alias EducationalPlatform.Courses.Class

    import EducationalPlatform.CoursesFixtures

    @invalid_attrs %{name: nil, date: nil, description: nil}

    test "list_class/0 returns all class" do
      class = class_fixture()
      assert Courses.list_class() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Courses.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      valid_attrs = %{name: "some name", date: ~D[2024-02-20], description: "some description"}

      assert {:ok, %Class{} = class} = Courses.create_class(valid_attrs)
      assert class.name == "some name"
      assert class.date == ~D[2024-02-20]
      assert class.description == "some description"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      update_attrs = %{name: "some updated name", date: ~D[2024-02-21], description: "some updated description"}

      assert {:ok, %Class{} = class} = Courses.update_class(class, update_attrs)
      assert class.name == "some updated name"
      assert class.date == ~D[2024-02-21]
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
