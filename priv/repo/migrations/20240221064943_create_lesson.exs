defmodule EducationalPlatform.Repo.Migrations.CreateLesson do
  use Ecto.Migration

  def change do
    create table(:lesson) do
      add :name, :string
      add :date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
