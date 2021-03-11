defmodule CvCreator.Repo.Migrations.AddSuperUserTable do
  use Ecto.Migration

  def change do
    create table(:super_users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string

      timestamps()

    end
  end
end
