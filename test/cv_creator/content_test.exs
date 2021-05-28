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

  describe "experience" do
    alias CvCreator.Content.Experience

    @valid_attrs %{company_name: "some company_name", description: "some description", ended_date: ~D[2010-04-17], started_date: ~D[2010-04-17]}
    @update_attrs %{company_name: "some updated company_name", description: "some updated description", ended_date: ~D[2011-05-18], started_date: ~D[2011-05-18]}
    @invalid_attrs %{company_name: nil, description: nil, ended_date: nil, started_date: nil}

    def experience_fixture(attrs \\ %{}) do
      {:ok, experience} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_experience()

      experience
    end

    test "list_experience/0 returns all experience" do
      experience = experience_fixture()
      assert Content.list_experience() == [experience]
    end

    test "get_experience!/1 returns the experience with given id" do
      experience = experience_fixture()
      assert Content.get_experience!(experience.id) == experience
    end

    test "create_experience/1 with valid data creates a experience" do
      assert {:ok, %Experience{} = experience} = Content.create_experience(@valid_attrs)
      assert experience.company_name == "some company_name"
      assert experience.description == "some description"
      assert experience.ended_date == ~D[2010-04-17]
      assert experience.started_date == ~D[2010-04-17]
    end

    test "create_experience/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_experience(@invalid_attrs)
    end

    test "update_experience/2 with valid data updates the experience" do
      experience = experience_fixture()
      assert {:ok, %Experience{} = experience} = Content.update_experience(experience, @update_attrs)
      assert experience.company_name == "some updated company_name"
      assert experience.description == "some updated description"
      assert experience.ended_date == ~D[2011-05-18]
      assert experience.started_date == ~D[2011-05-18]
    end

    test "update_experience/2 with invalid data returns error changeset" do
      experience = experience_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_experience(experience, @invalid_attrs)
      assert experience == Content.get_experience!(experience.id)
    end

    test "delete_experience/1 deletes the experience" do
      experience = experience_fixture()
      assert {:ok, %Experience{}} = Content.delete_experience(experience)
      assert_raise Ecto.NoResultsError, fn -> Content.get_experience!(experience.id) end
    end

    test "change_experience/1 returns a experience changeset" do
      experience = experience_fixture()
      assert %Ecto.Changeset{} = Content.change_experience(experience)
    end
  end
end
