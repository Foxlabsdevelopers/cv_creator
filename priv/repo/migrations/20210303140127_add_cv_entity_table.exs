defmodule CvCreator.Repo.Migrations.AddCvEntityTable do
  use Ecto.Migration

  def change do
    create table(:cv_entities) do
      add :name, :string
      add :description, :string
    end
  end
end
