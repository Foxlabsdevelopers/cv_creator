defmodule CvCreatorWeb.SuperUsersController do
  use CvCreatorWeb, :controller

  alias CvCreator.Accounts
  alias CvCreator.Accounts.SuperUsers

    def index(conn, _params) do
      super_users = Accounts.list_super_users()
      render(conn, "index.html", super_users: super_users)
    end

    def new(conn, _params) do
    changeset = Accounts.change_super_users(%SuperUsers{})
    render(conn, "new.html", changeset: changeset)
    end

  def create(conn, %{"super_users" => super_users_params}) do
    case Accounts.create_super_users(super_users_params) do
      {:ok, super_users} ->
        conn
        |> put_flash(:info, "super_users created successfully.")
        |> redirect(to: Routes.super_users_path(conn, :show, super_users))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    super_users = Accounts.get_super_users!(id)
    render(conn, "show.html", super_users: super_users)
  end

  def edit(conn, %{"id" => id}) do
    super_users = Accounts.get_super_users!(id)
    changeset = Accounts.change_super_users(super_users)
    render(conn, "edit.html", super_users: super_users, changeset: changeset)
  end

  def update(conn, %{"id" => id, "super_users" => super_users_params}) do
    super_users = Accounts.get_super_users!(id)

    case Accounts.update_super_users(super_users, super_users_params) do
      {:ok, super_users} ->
        conn
        |> put_flash(:info, "super_users updated successfully.")
        |> redirect(to: Routes.super_users_path(conn, :show, super_users))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", super_users: super_users, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    super_users = Accounts.get_super_users!(id)
    {:ok, _super_users} = Accounts.delete_super_users(super_users)

    conn
    |> put_flash(:info, "super_users deleted successfully.")
    |> redirect(to: Routes.super_users_path(conn, :index))
    end

end
