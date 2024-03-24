defmodule WabanexNlw.Users.Get do
  alias WabanexNlw.{User, Repo}
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
      user -> {:ok, user}
    end
  end
end
