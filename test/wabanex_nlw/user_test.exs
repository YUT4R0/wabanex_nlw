defmodule WabanexNlw.UserTest do
  use WabanexNlw.DataCase, async: true

  alias WabanexNlw.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "rafael",
        email: "rafael@gmail.com",
        password: "rafael123",
      }
      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "rafael", password: "rafael123", email: "rafael@gmail.com"},
        errors: []
      } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{
        name: "r",
        email: "rafael@gmail.com",
      }
      response = User.changeset(params)
      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
