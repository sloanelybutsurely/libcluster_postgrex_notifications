defmodule Cluster.Strategy.PostgrexNotificationsTest do
  use ExUnit.Case
  doctest Cluster.Strategy.PostgrexNotifications

  test "greets the world" do
    assert Cluster.Strategy.PostgrexNotifications.hello() == :world
  end
end
