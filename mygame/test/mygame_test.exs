defmodule MygameTest do
  use ExUnit.Case
  doctest Mygame

  test "greets the world" do
    assert Mygame.hello() == :world
  end
end
