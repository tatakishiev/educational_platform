defmodule EducationalPlatform.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  alias EducationalPlatform.Courses.ClassesLessons

  schema "class" do
    field :name, :string
    field :date, :date
    field :description, :string

    many_to_many :lessons, EducationalPlatform.Courses.Lesson, join_through: ClassesLessons
    belongs_to :user, EducationalPlatform.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs \\ %{}) do
    class
    |> cast(attrs, [:name, :description, :date, :user_id])
    |> validate_required([:name, :description, :date, :user_id])
  end
end
