defmodule EducationalPlatform.CoursesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EducationalPlatform.Courses` context.
  """

  @doc """
  Generate a class.
  """
  def class_fixture(attrs \\ %{}) do
    {:ok, class} =
      attrs
      |> Enum.into(%{
        descriptio: "some descriptio",
        name: "some name"
      })
      |> EducationalPlatform.Courses.create_class()

    class
  end

  @doc """
  Generate a class.
  """
  def class_fixture(attrs \\ %{}) do
    {:ok, class} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> EducationalPlatform.Courses.create_class()

    class
  end
end
