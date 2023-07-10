defmodule Cluster.Strategy.PostgrexNotifications do
  @moduledoc File.read!("#{__DIR__}/../../../README.md")
             |> String.split("<!-- MDOC -->")
             |> Enum.at(1)
  use GenServer
  use Cluster.Strategy

  alias Cluster.Strategy
  alias Cluster.Strategy.State

  @impl true
  def start_link([%State{} = state]) do
    GenServer.start_link(__MODULE__, [state])
  end

  @impl true
  def init([%State{} = state]) do
    {:ok, state, {:continue, :setup}}
  end

  @impl true
  def handle_continue(:setup, %State{config: config} = state) do
    postgrex = Keyword.fetch!(config, :postgrex)
    notifications = Keyword.fetch!(config, :notifications)
    channel = Keyword.fetch!(config, :channel)

    {:ok, ref} = Postgrex.Notifications.listen(notifications, channel)

    node = Node.self() |> Atom.to_string()

    state = %State{
      state
      | meta: %{ref: ref, channel: channel, postgrex: postgrex, node: node}
    }

    {:ok, _} = Postgrex.query(postgrex, "SELECT pg_notify($1, $2)", [channel, node])

    {:noreply, state}
  end

  @impl true
  def handle_info(
        {:notification, _pid, ref, channel, payload},
        %State{
          meta: %{ref: ref, channel: channel, node: node}
        } = state
      ) do
    unless node == payload do
      Strategy.connect_nodes(
        state.topology,
        state.connect,
        state.list_nodes,
        [String.to_atom(payload)]
      )
    end

    {:noreply, state}
  end
end
