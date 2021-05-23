defmodule Loco.Repo do
  use Ecto.Repo,
    otp_app: :loco,
    adapter: Ecto.Adapters.Postgres
end
