defmodule CvCreatorWeb.PageView do
  use CvCreatorWeb, :view

  def create(description) do
    case description do
      "creador de Curriculums para humanos" ->
        "Creador de Curriculums"
      nil ->
        "No hay texto"

    end
  end

    def send_information(text) do
       case text do
        "creado por" ->
          "creado por"
        nil ->
          "Sin informacion"
      end
    end

    def show(homepage) do
       case homepage do
        "home" ->
          "home"
        nil ->
          "Sin informacion"
      end
    end

    def message(information) do
       case information do
        "information" ->
          "information"
        nil ->
          "Sin informacion"
      end
    end
end
