defmodule ActionsExs.Repo do
  use Ecto.Repo,
    otp_app: :actions_exs,
    adapter: Ecto.Adapters.Postgres
end
