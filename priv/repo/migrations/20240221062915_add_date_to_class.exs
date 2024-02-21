defmodule EducationalPlatform.Repo.Migrations.AddDateColumnToClass do
  use Ecto.Migration

  def change do
    alter table("class") do
      add :date, :date
    end
  end

end
