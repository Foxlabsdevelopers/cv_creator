defmodule CvCreator.Content do

  alias CvCreator.Content.CvEntities
  alias CvCreator.Repo

  def list_cv_entities do
    Repo.all(CvEntities)
  end

  def get_cv_entities!(id), do: Repo.get!(CvEntities, id)

  def create_cv_entities(attrs \\ %{}) do
    %CvEntities{}
    |> CvEntities.changeset(attrs)
    |> Repo.insert()
  end

  def update_cv_entities(%CvEntities{} = cv_entities, attrs) do
    cv_entities
    |> CvEntities.changeset(attrs)
    |> Repo.update()
  end

  def delete_cv_entities(%CvEntities{} = cv_entities) do
    Repo.delete(cv_entities)
  end

  def change_cv_entities(%CvEntities{}= cv_entities, attrs \\ %{}) do
    CvEntities.changeset(cv_entities, attrs)
  end

end
