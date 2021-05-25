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


  alias CvCreator.Content.GeneralData

  @doc """
  Returns the list of general_data.

  ## Examples

      iex> list_general_data()
      [%GeneralData{}, ...]

  """
  def list_general_data do
    Repo.all(GeneralData)
  end

  @doc """
  Gets a single general_data.

  Raises `Ecto.NoResultsError` if the General data does not exist.

  ## Examples

      iex> get_general_data!(123)
      %GeneralData{}

      iex> get_general_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_general_data!(id), do: Repo.get!(GeneralData, id)

  @doc """
  Creates a general_data.

  ## Examples

      iex> create_general_data(%{field: value})
      {:ok, %GeneralData{}}

      iex> create_general_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_general_data(attrs \\ %{}) do
    %GeneralData{}
    |> GeneralData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a general_data.

  ## Examples

      iex> update_general_data(general_data, %{field: new_value})
      {:ok, %GeneralData{}}

      iex> update_general_data(general_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_general_data(%GeneralData{} = general_data, attrs) do
    general_data
    |> GeneralData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a general_data.

  ## Examples

      iex> delete_general_data(general_data)
      {:ok, %GeneralData{}}

      iex> delete_general_data(general_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_general_data(%GeneralData{} = general_data) do
    Repo.delete(general_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking general_data changes.

  ## Examples

      iex> change_general_data(general_data)
      %Ecto.Changeset{data: %GeneralData{}}

  """
  def change_general_data(%GeneralData{} = general_data, attrs \\ %{}) do
    GeneralData.changeset(general_data, attrs)
  end
end
