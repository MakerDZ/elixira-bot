defmodule Bot.Commands.PingCommand do
  alias Nostrum.Api

  def handle(msg) do
    Api.create_message(msg.channel_id, "pong!")
  end
end
