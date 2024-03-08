defmodule LvnPokemonWeb.HomeLive do
  use LvnPokemonWeb, :live_view

  use LiveViewNative.LiveView,
    formats: [:swiftui],
    layouts: [
      swiftui: {LvnPokemonWeb.Layouts.SwiftUI, :app}
    ]

  alias LvnPokemon.Pokemon

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:pokemon, Pokemon.list_pokemon())

    {:ok, socket, temporary_assigns: [caught_pokemon: %Pokemon{}]}
  end

  def handle_event("catch_em", _unsigned_params, %{assigns: %{pokemon: pokemon}} = socket) do
    caught_pokemon =
      pokemon
      |> Enum.shuffle()
      |> Enum.random()

    socket = assign(socket, caught_pokemon: caught_pokemon)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div :if={not is_nil(@caught_pokemon) > 0} class="mb-4">
      <img src={@caught_pokemon.sprite} class="inline" />
      <div><%= @caught_pokemon.name %></div>
    </div>
    <.button phx-click="catch_em">Catch 'em</.button>
    """
  end
end
