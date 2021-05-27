defmodule CvCreatorWeb.CvEntitiesController do
  use CvCreatorWeb, :controller

  alias CvCreator.Content
  alias CvCreator.Content.CvEntities

  def index(conn, _params) do
    cv_entities = Content.list_cv_entities()
    render(conn, "index.html", cv_entities: cv_entities)
  end

  def new(conn, _params) do
    changeset = Content.change_cv_entities(%CvEntities{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cv_entities" => cv_entities_params}) do
    case Content.create_cv_entities(cv_entities_params) do
      {:ok, cv_entities} ->
        conn
        |> put_flash(:info, "cv_entities created successfully.")
        |> redirect(to: Routes.cv_entities_path(conn, :show, cv_entities))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cv_entities = Content.get_cv_entities!(id)
    render(conn, "show.html", cv_entities: cv_entities)
  end

  def edit(conn, %{"id" => id}) do
    cv_entities = Content.get_cv_entities!(id)
    changeset = Content.change_cv_entities(cv_entities)
    render(conn, "edit.html", cv_entities: cv_entities, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cv_entities" => cv_entities_params}) do
    cv_entities = Content.get_cv_entities!(id)

    case Content.update_cv_entities(cv_entities, cv_entities_params) do
      {:ok, cv_entities} ->
        conn
        |> put_flash(:info, "cv_entities updated successfully.")
        |> redirect(to: Routes.cv_entities_path(conn, :show, cv_entities))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cv_entities: cv_entities, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cv_entities = Content.get_cv_entities!(id)
    {:ok, _cv_entities} = Content.deletes_cv_entities(cv_entities)

    conn
    |> put_flash(:info, "cv_entities deleted successfully.")
    |> redirect(to: Routes.cv_entities_path(conn, :index))
  end

end
