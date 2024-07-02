import Config
import Dotenvy

source!([".env", System.get_env()])
config :nostrum,
  token: env!("BOT_TOKEN", :string!),
  gateway_intents: [
    :guilds,
    :guild_messages,
    :message_content
  ]
