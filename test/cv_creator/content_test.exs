defmodule CvCreator.ContentTest do
  use CvCreator.DataCase

  alias CvCreator.Content

  describe "general_data" do
    alias CvCreator.Content.GeneralData

    @valid_attrs %{city: "some city", email: "some email", extract: "some extract", full_name: "some full_name", phone_number: "some phone_number"}
    @update_attrs %{city: "some updated city", email: "some updated email", extract: "some updated extract", full_name: "some updated full_name", phone_number: "some updated phone_number"}
    @invalid_attrs %{city: nil, email: nil, extract: nil, full_name: nil, phone_number: nil}

    def general_data_fixture(attrs \\ %{}) do
      {:ok, general_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_general_data()

      general_data
    end

    test "list_general_data/0 returns all general_data" do
      general_data = general_data_fixture()
      assert Content.list_general_data() == [general_data]
    end

    test "get_general_data!/1 returns the general_data with given id" do
      general_data = general_data_fixture()
      assert Content.get_general_data!(general_data.id) == general_data
    end

    test "create_general_data/1 with valid data creates a general_data" do
      assert {:ok, %GeneralData{} = general_data} = Content.create_general_data(@valid_attrs)
      assert general_data.city == "some city"
      assert general_data.email == "some email"
      assert general_data.extract == "some extract"
      assert general_data.full_name == "some full_name"
      assert general_data.phone_number == "some phone_number"
    end

    test "create_general_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_general_data(@invalid_attrs)
    end

    test "update_general_data/2 with valid data updates the general_data" do
      general_data = general_data_fixture()
      assert {:ok, %GeneralData{} = general_data} = Content.update_general_data(general_data, @update_attrs)
      assert general_data.city == "some updated city"
      assert general_data.email == "some updated email"
      assert general_data.extract == "some updated extract"
      assert general_data.full_name == "some updated full_name"
      assert general_data.phone_number == "some updated phone_number"
    end

    test "update_general_data/2 with invalid data returns error changeset" do
      general_data = general_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_general_data(general_data, @invalid_attrs)
      assert general_data == Content.get_general_data!(general_data.id)
    end

    test "delete_general_data/1 deletes the general_data" do
      general_data = general_data_fixture()
      assert {:ok, %GeneralData{}} = Content.delete_general_data(general_data)
      assert_raise Ecto.NoResultsError, fn -> Content.get_general_data!(general_data.id) end
    end

    test "change_general_data/1 returns a general_data changeset" do
      general_data = general_data_fixture()
      assert %Ecto.Changeset{} = Content.change_general_data(general_data)
    end
  end
end
