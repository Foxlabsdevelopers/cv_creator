defmodule CvCreatorWeb.PageController do
  use CvCreatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
 @doc """
   def home(conn, _params) do
    cv_entities = "list_cv_entities"
    render(conn, "home.html", cv_entities: cv_entities)
  end

"""
end
