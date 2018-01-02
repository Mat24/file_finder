defmodule FileFinderTest do
  use ExUnit.Case
  doctest FileFinder

  test "greets the world" do
    assert FileFinder.hello() == :world
  end
end
