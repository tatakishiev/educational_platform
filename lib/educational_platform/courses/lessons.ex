defmodule EducationalPlatform.Courses.Lessons do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lesson" do
    field :name, :string
    field :date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lessons, attrs) do
    lessons
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
