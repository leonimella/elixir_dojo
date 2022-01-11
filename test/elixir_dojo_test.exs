defmodule ElixirDojoTest do
  use ExUnit.Case
  doctest ElixirDojo

  test "greets the world" do
    assert ElixirDojo.hello() == :world
  end
end
