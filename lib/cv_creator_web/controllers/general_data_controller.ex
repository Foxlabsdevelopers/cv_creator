defmodule CvCreatorWeb.GeneralDataController do
  use CvCreatorWeb, :controller

  alias CvCreator.Content
  alias CvCreator.Content.GeneralData

  def index(conn, _params) do
    general_data = Content.list_general_data()
    render(conn, "index.html", general_data: general_data)
  end

  def new(conn, _params) do
    changeset = Content.change_general_data(%GeneralData{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"general_data" => general_data_params}) do
    case Content.create_general_data(general_data_params) do
      {:ok, general_data} ->
        conn
        |> put_flash(:info, "General data created successfully.")
        |> redirect(to: Routes.general_data_path(conn, :show, general_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    general_data = Content.get_general_data!(id)
    render(conn, "show.html", general_data: general_data)
  end

  def edit(conn, %{"id" => id}) do
    general_data = Content.get_general_data!(id)
    changeset = Content.change_general_data(general_data)
    render(conn, "edit.html", general_data: general_data, changeset: changeset)
  end

  def update(conn, %{"id" => id, "general_data" => general_data_params}) do
    general_data = Content.get_general_data!(id)

    case Content.update_general_data(general_data, general_data_params) do
      {:ok, general_data} ->
        conn
        |> put_flash(:info, "General data updated successfully.")
        |> redirect(to: Routes.general_data_path(conn, :show, general_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", general_data: general_data, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    general_data = Content.get_general_data!(id)
    {:ok, _general_data} = Content.delete_general_data(general_data)

    conn
    |> put_flash(:info, "General data deleted successfully.")
    |> redirect(to: Routes.general_data_path(conn, :index))
  end
end
