defmodule CvCreator.ContentTest do
  use CvCreator.DataCase

  alias CvCreator.Content

  describe "cv_entities" do
    alias CvCreator.Content.CvEntities

    @valid_attrs %{name: "some name", description: "some description"}
    @update_attrs %{name: "some updated name", description: "some updated description"}
    @invalid_attrs %{name: nil, description: nil}

    def cv_entities_fixture(attrs \\ %{}) do
      {:ok, cv_entities} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_cv_entities()

      cv_entities
    end

    test "list_cv_entities/0 returns all cv_entities" do
      cv_entities = cv_entities_fixture()
      assert Content.list_cv_entities() == [cv_entities]
    end

    test "get_cv_entities!/1 returns the cv_entities with given id" do
      cv_entities = cv_entities_fixture()
      assert Content.get_cv_entities!(cv_entities.id) == cv_entities
    end

    test "create_cv_entities/1 with valid data creates a cv_entities" do
      assert {:ok, %CvEntities{} = cv_entities} = Content.create_cv_entities(@valid_attrs)
      assert cv_entities.name == "some name"
      assert cv_entities.description == "some description"
    end

    test "create_cv_entities/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_cv_entities(@invalid_attrs)
    end

    test "update_cv_entities/2 with valid data updates the cv_entities" do
      cv_entities = cv_entities_fixture()
      assert {:ok, %CvEntities{} = cv_entities} = Content.update_cv_entities(cv_entities, @update_attrs)
      assert cv_entities.name == "some updated name"
      assert cv_entities.description == "some updated description"
    end

    test "update_cv_entities/2 with invalid data returns error changeset" do
      cv_entities = cv_entities_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_cv_entities(cv_entities, @invalid_attrs)
      assert cv_entities == Content.get_cv_entities!(cv_entities.id)
    end

    test "delete_cv_entities/1 deletes the cv_entities" do
      cv_entities = cv_entities_fixture()
      assert {:ok, %CvEntities{}} = Content.delete_cv_entities(cv_entities)
      assert_raise Ecto.NoResultsError, fn -> Content.get_cv_entities!(cv_entities.id) end
    end

    test "change_cv_entities/1 returns a cv_entities changeset" do
      cv_entities = cv_entities_fixture()
      assert %Ecto.Changeset{} = Content.change_cv_entities(cv_entities)
    end
  end
end
