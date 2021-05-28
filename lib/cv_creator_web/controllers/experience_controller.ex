defmodule CvCreatorWeb.ExperienceController do
  use CvCreatorWeb, :controller

  alias CvCreator.Content
  alias CvCreator.Content.Experience

  def index(conn, _params) do
    experience = Content.list_experience()
    render(conn, "index.html", experience: experience)
  end

  def new(conn, _params) do
    changeset = Content.change_experience(%Experience{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"experience" => experience_params}) do
    case Content.create_experience(experience_params) do
      {:ok, experience} ->
        conn
        |> put_flash(:info, "Experience created successfully.")
        |> redirect(to: Routes.experience_path(conn, :show, experience))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    experience = Content.get_experience!(id)
    render(conn, "show.html", experience: experience)
  end

  def edit(conn, %{"id" => id}) do
    experience = Content.get_experience!(id)
    changeset = Content.change_experience(experience)
    render(conn, "edit.html", experience: experience, changeset: changeset)
  end

  def update(conn, %{"id" => id, "experience" => experience_params}) do
    experience = Content.get_experience!(id)

    case Content.update_experience(experience, experience_params) do
      {:ok, experience} ->
        conn
        |> put_flash(:info, "Experience updated successfully.")
        |> redirect(to: Routes.experience_path(conn, :show, experience))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", experience: experience, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    experience = Content.get_experience!(id)
    {:ok, _experience} = Content.delete_experience(experience)

    conn
    |> put_flash(:info, "Experience deleted successfully.")
    |> redirect(to: Routes.experience_path(conn, :index))
  end
end
