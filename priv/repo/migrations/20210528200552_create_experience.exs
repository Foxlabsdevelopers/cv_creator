defmodule CvCreator.Repo.Migrations.CreateExperience do
  use Ecto.Migration

  def change do
    create table(:experience) do
      add :company_name, :string
      add :started_date, :date
      add :ended_date, :date
      add :description, :text
      add :general_data_id, references(:general_data, on_delete: :delete_all),
                    null: false

      timestamps()
    end

    create index(:experience, [:general_data_id])
  end
end
