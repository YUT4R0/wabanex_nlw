defmodule WabanexNlw.Users.Create do
  alias WabanexNlw.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
