defmodule EducationalPlatform.Repo.Migrations.DropClassTable do
  use Ecto.Migration

  def change do
      drop table("class")
    end
end
