defmodule WabanexNlw.IMCTest do
  use ExUnit.Case, async: true

  alias WabanexNlw.IMC

  describe "calculate/1" do
    test "returns data when file exists" do
      params = %{"filename" => "students.csv"}
      response = IMC.calculate(params)
      expected_response =
      {:ok,
        %{
          "Daniele" => 21.564544913741823,
          "Diego" => 23.25501863821347,
          "Maria" => 21.60410477990818,
          "Pedro" => 22.40817898532965,
          "Rafael" => 25.344352617079892
        }
      }
      assert response == expected_response
    end
    test "when the given file name is wrong, returns error" do
      params = %{"filename" => "penis.csv"}
      response = IMC.calculate(params)
      expected_response = {:error, "Error while opening the file"}
      assert response == expected_response
    end
  end
end
