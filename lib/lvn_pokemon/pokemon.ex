defmodule LvnPokemon.Pokemon do
  @doc false

  defstruct name: nil, sprite: nil

  def list_pokemon do
    fetch()
    |> Enum.map(fn result ->
      result = fetch(result["name"])

      %__MODULE__{name: result["name"], sprite: result["sprites"]["front_default"]}
    end)
  end

  def fetch do
    with {:ok, %{status_code: 200, body: body}} <-
           HTTPoison.get("https://pokeapi.co/api/v2/pokemon?limit=10&offset=0"),
         {:ok, response} <- Jason.decode(body) do
      response["results"]
    end
  end

  def fetch(name) do
    with {:ok, %{status_code: 200, body: body}} <-
           HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{name}"),
         {:ok, response} <- Jason.decode(body) do
      response
    end
  end
end
