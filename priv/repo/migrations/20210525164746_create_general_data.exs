defmodule CvCreator.Repo.Migrations.CreateGeneralData do
  use Ecto.Migration

  def change do
    create table(:general_data) do
      add :full_name, :string
      add :city, :string
      add :email, :string
      add :phone_number, :string
      add :extract, :text

      timestamps()
    end

  end
end
