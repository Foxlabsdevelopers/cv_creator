defmodule CvCreator.CvEntitiesControllerTest do
  use CvCreator.ConnCase

  alias CvCreator.Content

  @create_attrs %{name: "some name", description: "some description"}
  @update_attrs %{name: "some updated name", description: "some updated description"}
  @invalid_attrs %{name: nil, description: nil}

  def fixture(:cv_entities) do
    {:ok, cv_entities} = Content.create_cv_entities(@create_attrs)
    cv_entities
  end

  describe "index" do
    test "lists all cv_entities", %{conn: conn} do
      conn = get(conn, Routes.cv_entities_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing cv_entities"
    end
  end

  describe "new cv_entities" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cv_entities_path(conn, :new))
      assert html_response(conn, 200) =~ "New cv_entities"
    end
  end

  describe "create cv_entities" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cv_entities_path(conn, :create), cv_entities: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cv_entities_path(conn, :show, id)

      conn = get(conn, Routes.cv_entities_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show cv_entities"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cv_entities_path(conn, :create), cv_entities: @invalid_attrs)
      assert html_response(conn, 200) =~ "New cv_entities"
    end
  end

  describe "edit cv_entities" do
    setup [:create_cv_entities]

    test "renders form for editing chosen cv_entities", %{conn: conn, cv_entities: cv_entities} do
      conn = get(conn, Routes.cv_entities_path(conn, :edit, cv_entities))
      assert html_response(conn, 200) =~ "Edit cv_entities"
    end
  end

  describe "update cv_entities" do
    setup [:create_cv_entities]

    test "redirects when data is valid", %{conn: conn, cv_entities: cv_entities} do
      conn = put(conn, Routes.cv_entities_path(conn, :update, cv_entities), cv_entities: @update_attrs)
      assert redirected_to(conn) == Routes.cv_entities_path(conn, :show, cv_entities)

      conn = get(conn, Routes.cv_entities_path(conn, :show, cv_entities))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, cv_entities: cv_entities} do
      conn = put(conn, Routes.cv_entities_path(conn, :update, cv_entities), cv_entities: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit cv_entities"
    end
  end

  describe "delete cv_entities" do
    setup [:create_cv_entities]

    test "deletes chosen cv_entities", %{conn: conn, cv_entities: cv_entities} do
      conn = delete(conn, Routes.cv_entities_path(conn, :delete, cv_entities))
      assert redirected_to(conn) == Routes.cv_entities_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cv_entities_path(conn, :show, cv_entities))
      end
    end
  end

  defp create_cv_entities(_) do
    cv_entities = fixture(:cv_entities)
    %{cv_entities: cv_entities}
  end
end
