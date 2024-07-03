defmodule Bot.Consumer do
  use Nostrum.Consumer

  alias Bot.Events.GuildMemberHandler
  alias Bot.Events.MessageCreateHandler

  def handle_event({:GUILD_MEMBER_ADD, _args, _ws_state} = event) do
    GuildMemberHandler.handle(event)
  end

  def handle_event({:MESSAGE_CREATE, _msg, _ws_state} = event) do
    MessageCreateHandler.handle(event)
  end
end
