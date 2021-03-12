defmodule CvCreator.Accounts.SuperUsers do
  use Ecto.Schema
  import Ecto.Changeset

  schema "super_users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string

    timestamps()
  end

  def changeset(super_users, attrs) do
    super_users
    |> cast(attrs, [:name, :email, :password_hash])
    |> validate_confirmation(:password_hash)
    |> validate_required([:email])
  end

end
