defmodule CvCreator.Repo.Migrations.AddExperienceIdToGeneralData do
  use Ecto.Migration

  def change do

    alter table(:general_data) do
      add :experience_id, references(:experience, on_delete: :delete_all),
                      null: false
    end

    create index(:general_data, [:experience_id])

  end
end
