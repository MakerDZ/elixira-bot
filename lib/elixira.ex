defmodule ExampleConsumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "ping!" ->
        Api.create_message(msg.channel_id, "pong!!")
      _ ->
        :ignore
    end
  end
end

defmodule Elixira do
  use Application

  def start(_type, _args) do
    children = [ExampleConsumer]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def sendMessage() do
    _msg = Nostrum.Api.create_message!(1160754823696756826, "Very first message sent from a Discord bot written in Elixir-lang.")
  end
end
