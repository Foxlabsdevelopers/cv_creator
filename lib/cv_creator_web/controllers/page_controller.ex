defmodule CvCreatorWeb.PageController do
  use CvCreatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
