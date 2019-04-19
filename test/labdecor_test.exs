defmodule LabdecorTest do
  use ExUnit.Case
  doctest Labdecor

  test "greets the world" do
    assert Labdecor.hello() == :world
  end
end
