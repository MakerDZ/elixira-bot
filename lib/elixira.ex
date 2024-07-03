defmodule Elixira do
  use Application
  alias Bot.Consumer

  def start(_type, _args) do
    children = [Consumer]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def sendMessage() do
    _msg = Nostrum.Api.create_message!(1160754823696756826, "Very first message sent from a Discord bot written in Elixir-lang.")
  end
end
