defmodule VishalRs.Repo do
  use Ecto.Repo,
    otp_app: :vishal_rs,
    adapter: Ecto.Adapters.SQLite3
end
