defmodule CvCreator.Repo do
  use Ecto.Repo,
    otp_app: :cv_creator,
    adapter: Ecto.Adapters.Postgres
end
