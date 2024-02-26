defmodule EducationalPlatform.Courses.Lesson do
  use Ecto.Schema
  import Ecto.Changeset

  alias EducationalPlatform.Courses.ClassesLessons

  schema "lesson" do
    field :name, :string
    field :date, :date

    many_to_many :classes, ClassesLessons, join_through: "classes_lessons"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lesson, attrs) do
    lesson
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
