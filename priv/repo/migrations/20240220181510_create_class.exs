defmodule EducationalPlatform.Repo.Migrations.CreateClass do
  use Ecto.Migration

  def change do
    create table(:class) do
      add :name, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
