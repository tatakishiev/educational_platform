defmodule EducationalPlatform.Repo.Migrations.ClassToLessonManyToMany do
  use Ecto.Migration

  def change do
    create table(:classes_lessons) do
      add :class_id, references(:class)
      add :lesson_id, references(:lesson)
    end
  end
end
