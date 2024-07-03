defmodule Bot.Events.MessageCreateHandler do
  alias Bot.Commands.PingCommand

  def handle({:MESSAGE_CREATE, msg, _ws_state}) do
    if String.starts_with?(msg.content, "!") do
      command = String.trim_leading(msg.content, "!")
      handle_command(command, msg)
    else
      IO.puts("Normal message.")
      :ignore
    end
  end

  defp handle_command(command, msg) do
    case String.downcase(command) do
      "ping" -> PingCommand.handle(msg)
      _ ->
        IO.puts("Unknown command: #{command}")
        :ignore
    end
  end
end
