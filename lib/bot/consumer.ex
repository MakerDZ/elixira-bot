defmodule Elixira.Consumer do
  use Nostrum.Consumer

  alias Elixira.Events.GuildMemberHandler
  alias Elixira.Commands.PingCommand

  def handle_event({:GUILD_MEMBER_ADD, _args, _ws_state} = event) do
    GuildMemberHandler.handle(event)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "!ping" -> PingCommand.handle(msg)
      _ -> :ignore
    end
  end
end
