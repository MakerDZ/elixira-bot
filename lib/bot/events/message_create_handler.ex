defmodule MessageCreateConsumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def handle_event({:GUILD_MEMBER_ADD, {_guild_id, member}, _ws_state}) do
    # This event is triggered when a new member joins the guild
    welcome_channel_id = 123456789  # Replace with your welcome channel ID
    username = member.user.username

    welcome_message = "Welcome to the server, #{username}!"
    Api.create_message(welcome_channel_id, welcome_message)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      "ping!" ->
        Api.create_message(msg.channel_id, "pong!!")
      _ ->
        :ignore
    end
  end
end
