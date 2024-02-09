defmodule LvnPokemon.Repo do
  use Ecto.Repo,
    otp_app: :lvn_pokemon,
    adapter: Ecto.Adapters.Postgres
end
