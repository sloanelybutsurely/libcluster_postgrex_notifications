defmodule Example do
  def run do
    {:ok, postgrex} = Postgrex.start_link(database: "postgres")
    {:ok, notifications} = Postgrex.Notifications.start_link(database: "postgres")

    topologies = [
      example: [
        strategy: Cluster.Strategy.PostgrexNotifications,
        config: [
          postgrex: postgrex,
          notifications: notifications,
          channel: "libcluster_postgrex_notifications"
        ]
      ]
    ]

    children = [{Cluster.Supervisor, [topologies, [name: __MODULE__.ClusterSupervisor]]}]

    Supervisor.start_link(children, strategy: :one_for_one, name: __MODULE__.Supervisor)
  end
end
