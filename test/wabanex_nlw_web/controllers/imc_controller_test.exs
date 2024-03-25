defmodule WabanexNlwWeb.IMCControllerTest do
  use WabanexNlwWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns IMC info", %{conn: conn} do
      params = %{"filename" => "students.csv"}
      response = conn
      |> get("/api", params)
      |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Daniele" => 21.564544913741823,
          "Diego" => 23.25501863821347,
          "Maria" => 21.60410477990818,
          "Pedro" => 22.40817898532965,
          "Rafael" => 25.344352617079892
        }
      }
      assert response == expected_response
    end

    test "when there are invalid, returns an error", %{conn: conn} do
      params = %{"filename" => "otherthing.csv"}
      response = conn
      |> get("/api", params)
      |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}
      assert response == expected_response
    end
  end
end
