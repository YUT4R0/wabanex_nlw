defmodule WabanexNlw.Trainings.Create do
  alias WabanexNlw.{Repo, Training}

  def call(params) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
