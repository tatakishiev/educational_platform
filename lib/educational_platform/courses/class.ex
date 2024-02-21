defmodule EducationalPlatform.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "class" do
    field :name, :string
    field :date, :date
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:name, :description, :date])
    |> validate_required([:name, :description, :date])
  end
end
