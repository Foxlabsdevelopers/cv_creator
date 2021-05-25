defmodule CvCreatorWeb.GeneralDataControllerTest do
  use CvCreatorWeb.ConnCase

  alias CvCreator.Content

  @create_attrs %{city: "some city", email: "some email", extract: "some extract", full_name: "some full_name", phone_number: "some phone_number"}
  @update_attrs %{city: "some updated city", email: "some updated email", extract: "some updated extract", full_name: "some updated full_name", phone_number: "some updated phone_number"}
  @invalid_attrs %{city: nil, email: nil, extract: nil, full_name: nil, phone_number: nil}

  def fixture(:general_data) do
    {:ok, general_data} = Content.create_general_data(@create_attrs)
    general_data
  end

  describe "index" do
    test "lists all general_data", %{conn: conn} do
      conn = get(conn, Routes.general_data_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing General data"
    end
  end

  describe "new general_data" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.general_data_path(conn, :new))
      assert html_response(conn, 200) =~ "New General data"
    end
  end

  describe "create general_data" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.general_data_path(conn, :create), general_data: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.general_data_path(conn, :show, id)

      conn = get(conn, Routes.general_data_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show General data"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.general_data_path(conn, :create), general_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "New General data"
    end
  end

  describe "edit general_data" do
    setup [:create_general_data]

    test "renders form for editing chosen general_data", %{conn: conn, general_data: general_data} do
      conn = get(conn, Routes.general_data_path(conn, :edit, general_data))
      assert html_response(conn, 200) =~ "Edit General data"
    end
  end

  describe "update general_data" do
    setup [:create_general_data]

    test "redirects when data is valid", %{conn: conn, general_data: general_data} do
      conn = put(conn, Routes.general_data_path(conn, :update, general_data), general_data: @update_attrs)
      assert redirected_to(conn) == Routes.general_data_path(conn, :show, general_data)

      conn = get(conn, Routes.general_data_path(conn, :show, general_data))
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, general_data: general_data} do
      conn = put(conn, Routes.general_data_path(conn, :update, general_data), general_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit General data"
    end
  end

  describe "delete general_data" do
    setup [:create_general_data]

    test "deletes chosen general_data", %{conn: conn, general_data: general_data} do
      conn = delete(conn, Routes.general_data_path(conn, :delete, general_data))
      assert redirected_to(conn) == Routes.general_data_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.general_data_path(conn, :show, general_data))
      end
    end
  end

  defp create_general_data(_) do
    general_data = fixture(:general_data)
    %{general_data: general_data}
  end
end
