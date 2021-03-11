defmodule CvCreator.Accounts do

  alias CvCreator.Repo
  alias CvCreator.Accounts.SuperUsers

  def list_super_users do
     Repo.all(SuperUsers)
  end

  def get_super_users!(id), do: Repo.get!(SuperUsers, id)

  def create_super_users(attrs \\ %{}) do
    %SuperUsers{}
    |> SuperUsers.changeset(attrs)
    |> Repo.insert()
  end

    def update_super_users(%SuperUsers{} = super_users, attrs) do
    super_users
    |> SuperUsers.changeset(attrs)
    |> Repo.update()
  end

  def delete_super_users(%SuperUsers{} = super_users) do
    Repo.delete(super_users)
  end

  def change_super_users(%SuperUsers{} = super_users, attrs \\ %{}) do
    SuperUsers.changeset(super_users, attrs)
  end

end
