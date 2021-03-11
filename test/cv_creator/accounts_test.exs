defmodule CvCreator.AccountsTest do
  use CvCreator.DataCase

  alias CvCreator.Accounts

  describe "super_users" do
    alias CvCreator.Accounts.SuperUsers

    @valid_attrs %{name: "some name", email: "some email", password_hash: "some password_hash"}
    @update_attrs %{name: "some updated name", email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{name: nil, email: nil, password_hash: nil}

    def super_users_fixture(attrs \\ %{}) do
      {:ok, super_users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_super_users()

      super_users
    end

    test "list_super_users/0 returns all super_users" do
      super_users = super_users_fixture()
      assert Accounts.list_super_users() == [super_users]
    end

    test "get_super_users!/1 returns the super_users with given id" do
      super_users = super_users_fixture()
      assert Accounts.get_super_users!(super_users.id) == super_users
    end

    test "create_super_users/1 with valid data creates a super_users" do
      assert {:ok, %SuperUsers{} = super_users} = Accounts.create_super_users(@valid_attrs)
      assert super_users.name == "some name"
      assert super_users.email == "some email"
      assert super_users.password_hash == "some password_hash"
    end

    test "create_super_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_super_users(@invalid_attrs)
    end

    test "update_super_users/2 with valid data updates the super_users" do
      super_users = super_users_fixture()
      assert {:ok, %SuperUsers{} = super_users} = Accounts.update_super_users(super_users, @update_attrs)
      assert super_users.name == "some updated name"
      assert super_users.email == "some updated email"
      assert super_users.password_hash == "some updated password_hash"
    end

    test "update_super_users/2 with invalid data returns error changeset" do
      super_users = super_users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_super_users(super_users, @invalid_attrs)
      assert super_users == Accounts.get_super_users!(super_users.id)
    end

    test "delete_super_users/1 deletes the super_users" do
      super_users = super_users_fixture()
      assert {:ok, %SuperUsers{}} = Accounts.delete_super_users(super_users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_super_users!(super_users.id) end
    end

    test "change_super_users/1 returns a super_users changeset" do
      super_users = super_users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_super_users(super_users)
    end
  end
end
