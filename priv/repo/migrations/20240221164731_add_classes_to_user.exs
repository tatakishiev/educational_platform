defmodule EducationalPlatform.Repo.Migrations.AddClassesToUser do
  use Ecto.Migration

  def change do
    alter table(:class) do
      add :user_id, references(:users)
    end
  end
end
