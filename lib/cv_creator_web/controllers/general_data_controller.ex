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
    case Content.create_general_data(conn.assigns.current_experience, general_data_params) do
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

  def edit(conn, _) do
    general_data = Content.get_general_data!(id)
    changeset = Content.change_general_data(conn.assigns.general_data)
    render(conn, "edit.html", changeset: changeset)
  end

  def update(conn, %{"general_data" => general_data_params}) do
    general_data = Content.get_general_data!(id)

    case Content.update_general_data(conn.assigns.general_data, general_data_params) do
      {:ok, general_data} ->
        conn
        |> put_flash(:info, "General data updated successfully.")
        |> redirect(to: Routes.general_data_path(conn, :show, general_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset)
    end
  end

  def delete(conn, _) do
    general_data = Content.get_general_data!(id)
    {:ok, _general_data} = Content.delete_general_data(conn.assigns.general_data)

    conn
    |> put_flash(:info, "General data deleted successfully.")
    |> redirect(to: Routes.general_data_path(conn, :index))
  end

  defp require_existing_experience(conn, _) do
    experience = Content.ensure_experience_exists(conn.assigns.current_general_data)
    assign(conn, :current_experience, experience)
  end

  defp authorize_general_data(conn, _) do
    general_data = Content.get_general_data!(conn.params["id"])

    if conn.assigns.current_experience.id == general_data.experience_id do
      assign(conn, :general_data, general_data)
    else
      conn
      |> put_flash(:error, "You can't modify that general_data")
      |> redirect(to: Routes.general_data_path(conn, :index))
      |> halt()
    end
  end
end
