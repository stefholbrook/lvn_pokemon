defmodule LvnPokemon.Pokemon do
  @doc false

  def list_pokemon do
    with {:ok, response} <- fetch(),
         {:ok, body} <- Jason.decode(response.body) do
      IO.inspect(body)
    else
      err -> err
    end
  end

  def fetch do
    HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=10&offset=0")
  end
end
