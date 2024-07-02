defmodule ElixiraTest do
  use ExUnit.Case
  doctest Elixira

  test "greets the world" do
    assert Elixira.hello() == :world
  end
end
