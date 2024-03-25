defmodule WabanexNlwWeb.SchemaTest do
  use WabanexNlwWeb.ConnCase, async: true

  alias WabanexNlw.User
  alias WabanexNlw.Users.Create

  describe "users query" do
    test "when a valid id is given, returns user", %{conn: conn} do
      params = %{
        name: "rafael",
        email: "rafael@gmail.com",
        password: "rafael123",
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      query = """
      {
        getUser(id: "#{user_id}") {
          name,
          email,
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "rafael@gmail.com",
            "name" => "rafael"
          }
        }
      }
      assert response = expected_response
    end

    test "when an invalid id is given, returns error", %{conn: conn} do
      params = %{
        name: "rafael",
        email: "rafael@gmail.com",
        password: "rafael123",
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      query = """
      {
        getUser(id: "22c56831-09f8-4dd7-8c44-dd25e9427cc1") {
          name,
          email,
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{"getUser" => nil}, "errors" => [
          %{"locations" => [
              %{"column" => 3, "line" => 2}
            ], "message" => "User not found", "path" => ["getUser"]
          }]}
      assert response = expected_response
    end
  end

  describe "users mutation" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "pedro"
            email: "pedro@gmail.com"
            password: "pedro123"
          }) {
            id
            name
          }
        }
      """
      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)
      assert %{"data" => %{"createUser" => %{"id" => _id, "name" => "pedro"}}} = response
    end
  end
end
