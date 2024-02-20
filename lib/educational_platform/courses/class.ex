defmodule EducationalPlatform.Courses.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "class" do
    field :name, :string
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
