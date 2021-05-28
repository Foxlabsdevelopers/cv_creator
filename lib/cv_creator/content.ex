defmodule CvCreator.Content do
  alias CvCreator.Repo

  alias CvCreator.Content.GeneralData
  alias CvCreator.Content.{GeneralData, Experience}

  @doc """
  Returns the list of general_data.

  ## Examples

      iex> list_general_data()
      [%GeneralData{}, ...]

  """
  def list_general_data do
    GeneralData
    |>Repo.all()
    |>Repo.preload(:experience)
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
  def get_general_data!(id) do
   GeneralData
   |>Repo.get!(id)
   |>Repo.preload(:experience)
  end
  @doc """
  Creates a general_data.

  ## Examples

      iex> create_general_data(%{field: value})
      {:ok, %GeneralData{}}

      iex> create_general_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_general_data(%Experience{} = experience, attrs \\ %{}) do
    %GeneralData{}
    |> GeneralData.changeset(attrs)
    |> Ecto.Changeset.put_change(:experience_id, experience.id)
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

  alias CvCreator.Content.Experience

  @doc """
  Returns the list of experience.

  ## Examples

      iex> list_experience()
      [%Experience{}, ...]

  """
  def list_experience do
    Repo.all(Experience)
  end

  @doc """
  Gets a single experience.

  Raises `Ecto.NoResultsError` if the Experience does not exist.

  ## Examples

      iex> get_experience!(123)
      %Experience{}

      iex> get_experience!(456)
      ** (Ecto.NoResultsError)

  """
  def get_experience!(id) do
    Experience
    |>Repo.get!(id)
    |>Repo.preload(:general_data)
  end
  @doc """
  Creates a experience.

  ## Examples

      iex> create_experience(%{field: value})
      {:ok, %Experience{}}

      iex> create_experience(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_experience(%GeneralData{} = general_data, attrs \\ %{}) do
    %Experience{}
    |> Experience.changeset(attrs)
    |> Ecto.Changeset.put_change(:general_data_id, general_data.id)
    |> Repo.insert()
  end

  @doc """
  Updates a experience.

  ## Examples

      iex> update_experience(experience, %{field: new_value})
      {:ok, %Experience{}}

      iex> update_experience(experience, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_experience(%Experience{} = experience, attrs) do
    experience
    |> Experience.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a experience.

  ## Examples

      iex> delete_experience(experience)
      {:ok, %Experience{}}

      iex> delete_experience(experience)
      {:error, %Ecto.Changeset{}}

  """
  def delete_experience(%Experience{} = experience) do
    Repo.delete(experience)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking experience changes.

  ## Examples

      iex> change_experience(experience)
      %Ecto.Changeset{data: %Experience{}}

  """
  def change_experience(%Experience{} = experience, attrs \\ %{}) do
    Experience.changeset(experience, attrs)
  end

end
