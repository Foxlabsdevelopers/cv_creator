defmodule CvCreator.Content.GeneralData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "general_data" do
    field :city, :string
    field :email, :string
    field :extract, :string
    field :full_name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(general_data, attrs) do
    general_data
    |> cast(attrs, [:full_name, :city, :email, :phone_number, :extract])
    |> validate_required([:full_name, :city, :email, :phone_number, :extract])
  end
end
