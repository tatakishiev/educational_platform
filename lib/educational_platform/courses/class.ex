defmodule EducationalPlatform.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  alias EducationalPlatform.Courses.UsersClasses
  alias EducationalPlatform.Courses.ClassesLessons

  schema "class" do
    field :name, :string
    field :date, :date
    field :description, :string

    many_to_many :lessons, EducationalPlatform.Courses.Lesson, join_through: ClassesLessons
    belongs_to :user, EctoAssoc.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs \\ %{}) do
    class
    |> cast(attrs, [:name, :description, :date])
    |> validate_required([:name, :description, :date])
  end
end
