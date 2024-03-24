defmodule WabanexNlw.Repo do
  use Ecto.Repo,
    otp_app: :wabanex_nlw,
    adapter: Ecto.Adapters.Postgres
end
