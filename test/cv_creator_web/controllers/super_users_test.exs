defmodule CvCreatorWeb.SuperUsersControllerTest do
  use CvCreatorWeb.ConnCase

  alias CvCreator.Accounts

  @create_attrs %{name: "some name", email: "some email", password_hash: "some password_hash"}
  @update_attrs %{name: "some updated name", email: "some updated email", password_hash: "some updated password_hash"}
  @invalid_attrs %{name: nil, email: nil, password_hash: nil}

  def fixture(:super_users) do
    {:ok, super_users} = Accounts.create_super_users(@create_attrs)
    super_users
  end

  describe "index" do
    test "lists all super_users", %{conn: conn} do
      conn = get(conn, Routes.super_users_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing SuperUsers"
    end
  end

  describe "new super_users" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.super_users_path(conn, :new))
      assert html_response(conn, 200) =~ "New SuperUsers"
    end
  end

  describe "create super_users" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.super_users_path(conn, :create), super_users: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.super_users_path(conn, :show, id)

      conn = get(conn, Routes.super_users_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show SuperUsers"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.super_users_path(conn, :create), super_users: @invalid_attrs)
      assert html_response(conn, 200) =~ "New SuperUsers"
    end
  end

  describe "edit super_users" do
    setup [:create_super_users]

    test "renders form for editing chosen super_users", %{conn: conn, super_users: super_users} do
      conn = get(conn, Routes.super_users_path(conn, :edit, super_users))
      assert html_response(conn, 200) =~ "Edit SuperUsers"
    end
  end

  describe "update super_users" do
    setup [:create_super_users]

    test "redirects when data is valid", %{conn: conn, super_users: super_users} do
      conn = put(conn, Routes.super_users_path(conn, :update, super_users), super_users: @update_attrs)
      assert redirected_to(conn) == Routes.super_users_path(conn, :show, super_users)

      conn = get(conn, Routes.super_users_path(conn, :show, super_users))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, super_users: super_users} do
      conn = put(conn, Routes.super_users_path(conn, :update, super_users), super_users: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit SuperUsers"
    end
  end

  describe "delete super_users" do
    setup [:create_super_users]

    test "deletes chosen super_users", %{conn: conn, super_users: super_users} do
      conn = delete(conn, Routes.super_users_path(conn, :delete, super_users))
      assert redirected_to(conn) == Routes.super_users_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.super_users_path(conn, :show, super_users))
      end
    end
  end

  defp create_super_users(_) do
    super_users = fixture(:super_users)
    %{super_users: super_users}
  end
end
