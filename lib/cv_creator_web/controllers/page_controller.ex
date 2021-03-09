defmodule CvCreatorWeb.PageController do
  use CvCreatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

   def about(conn, _params) do
    description = "creador de Curriculums para humanos"
    render(conn, "about.html", description: description)
  end

  def createdby(conn, _params) do
    text= "creado por"
    render(conn, "created_by.html", text: text)
  end

  def home(conn, _params) do
    homepage= "home"
    render(conn, "home.html", homepage: homepage)
  end

  def contact(conn, _params) do
    information= "contact"
    render(conn, "contact.html", information: information)
  end
end
