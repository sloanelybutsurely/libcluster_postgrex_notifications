defmodule Cluster.Strategy.PostgrexNotifications.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :libcluster_postgrex_notifications,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # for Hex.pm
      name: "libcluster_postgrex_notifications",
      source_url: "https://github.com/sloanelybutsurely/libcluster_postgrex_notifications",
      homepage_url: "https://github.com/sloanelybutsurely/libcluster_postgrex_notifications",
      description: "Postgrex.Notifications clustering strategy for libcluster",
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:libcluster, "~> 3.3"},
      {:postgrex, "~> 0.17.1"},
      {:ex_doc, "~> 0.30.1", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/sloanelybutsurely/libcluster_postgrex_notifications"
      }
    ]
  end

  defp docs do
    [
      main: "Cluster.Strategy.PostgrexNotifications"
    ]
  end
end
