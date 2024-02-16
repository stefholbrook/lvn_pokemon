defmodule LvnPokemonWeb.Styles.SwiftUI do
  use LiveViewNative.Stylesheet, :swiftui

  ~SHEET"""
  "resizable" do
    resizable()
  end
  """

  def class("frame:" <> dims) do
    [width] = Regex.run(~r/w(\d+)/, dims, capture: :all_but_first)
    [height] = Regex.run(~r/h(\d+)/, dims, capture: :all_but_first)

    ~RULES"""
    frame(width: {width}, height: {height})
    """
  end
end
