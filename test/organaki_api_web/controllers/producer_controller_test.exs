defmodule OrganakiApiWeb.ProducerControllerTest do
  use OrganakiApiWeb.ConnCase

  import OrganakiApi.ProducersFixtures

  alias OrganakiApi.Accounts.User

  @create_attrs %{
    email: "some@email",
    lat: 120.5,
    lng: 120.5,
    name: "some name",
    short_description: "some short_description"
  }
  @update_attrs %{
    email: "any@email",
    lat: 120.6,
    lng: 120.4,
    name: "any name",
    short_description: "any short_description"
  }

  # missing the required name field, and wrong format for lat
  @invalid_attrs %{
    email: "any@email",
    lat: "a120.6",
    lng: 120.4,
    short_description: "any short_description"
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all visible producers", %{conn: conn} do
      conn = get(conn, ~p"/api/producers")
      assert json_response(conn, 200)["producers"] == []

      for _ <- 1..10 do
        producer_fixture()
      end

      for _ <- 1..10 do
        producer_fixture(%{"visible_producer" => true})
      end

      response =
        conn
        |> get(~p"/api/producers")
        |> json_response(200)

      assert Enum.count(response["producers"]) == 10
    end
  end

  describe "create producer" do
    test "creates and renders producer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/producers", producer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["producer"]

      conn = get(conn, ~p"/api/producers/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["producer"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/producers", producer: @invalid_attrs)

      assert json_response(conn, 422)["errors"] == %{
               "lat" => ["is invalid"],
               "name" => ["can't be blank"]
             }
    end
  end

  describe "update producer" do
    setup [:create_producer]

    test "renders producer when data is valid", %{conn: conn, producer: %User{id: id}} do
      conn = put(conn, ~p"/api/producers/#{id}", producer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["producer"]

      conn = get(conn, ~p"/api/producers/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["producer"]
    end

    test "renders errors when data is invalid", %{conn: conn, producer: %User{id: id}} do
      conn = put(conn, ~p"/api/producers/#{id}", producer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] == %{"lat" => ["is invalid"]}
    end
  end

  describe "delete producer" do
    setup [:create_producer]

    test "deletes chosen producer", %{conn: conn, producer: %User{id: id}} do
      conn = delete(conn, ~p"/api/producers/#{id}")
      assert response(conn, 204)

      assert response(get(conn, ~p"/api/producers/#{id}"), 404)
    end
  end

  defp create_producer(_test_data) do
    producer = producer_fixture()
    %{producer: producer}
  end
end
