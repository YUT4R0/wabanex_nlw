defmodule WabanexNlw.Users.Get do
  import Ecto.Query

  alias WabanexNlw.{User, Repo, Training}
  alias Ecto.UUID

  def call(id) do
    id
    |> UUID.cast()
    |> handle_res()
  end

  defp handle_res(:error), do: {:error, "Invalid UUID"}

  defp handle_res({:ok, uuid}) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()
    query =
      from t in Training,
        where: ^today >= t.start_date and ^today <= t.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
