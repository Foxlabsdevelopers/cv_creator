defmodule CvCreator.Content.Experience do
  use Ecto.Schema
  import Ecto.Changeset


  schema "experience" do
    field :company_name, :string
    field :description, :string
    field :ended_date, :date
    field :started_date, :date
    has_one :general_data, Content.GeneralData

    timestamps()
  end

  @doc false
  def changeset(experience, attrs) do
    experience
    |> cast(attrs, [:company_name, :started_date, :ended_date, :description])
    |> validate_required([:company_name, :started_date, :ended_date, :description])
  end
end
