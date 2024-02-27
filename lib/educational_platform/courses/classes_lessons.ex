defmodule EducationalPlatform.Courses.ClassesLessons do
  use Ecto.Schema

  alias EducationalPlatform.Courses.{Class, Lesson}

  schema "classes_lessons" do
    belongs_to :class, Class
    belongs_to :lesson, Lesson
  end

  # def changeset(class_lesson, attrs \\ {}) do
  #   class_lesson
  #   |> cast(attrs, [:class_id, :lesson_id])
  # end
end
