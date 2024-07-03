defmodule Elixira.Events.GuildMemberHandler do
  alias Nostrum.Api

  def handle({:GUILD_MEMBER_ADD, {_guild_id, member}, _ws_state}) do
    welcome_channel_id = 1160754823696756826
    IO.inspect(member, label: "new member joined.")
    user_id = member.user_id
    Api.create_message(welcome_channel_id, "Welcome <@#{user_id}>!")
  end
end
