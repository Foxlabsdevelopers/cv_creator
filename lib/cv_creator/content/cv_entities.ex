defmodule CvCreator.Content.CvEntities do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cv_entities" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  def changeset(cv_entities, attrs) do
    cv_entities
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end

end
