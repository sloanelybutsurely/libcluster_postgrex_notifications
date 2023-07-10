# libcluster_postgrex_notifications

[![Module Version](https://img.shields.io/hexpm/v/libcluster_postgrex_notifications.svg)](https://hex.pm/packages/libcluster_postgrex_notifications)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/libcluster_postgrex_notifications/)

<!-- MDOC -->

A clustering strategy for [libcluster](https://hexdocs.pm/libcluster) using PostgreSQL [`LISTEN`](https://postgresql.org/docs/current/interactive/sql-listen.html)/[`NOTIFY`](https://www.postgresql.org/docs/current/sql-notify.html) and [`Postgrex.Notifications`](https://hexdocs.pm/postgrex/Postgrex.Notifications.html).

## Motivations

Many Elixir applications already depend on a single PostgreSQL database. That same database is used to communicate between nodes and form a cluster without any additional infrastructure.

## Features

- 

## Installation

This package can be installed from [hex](https://hex.pm/package/libcluster_postgrex_notifications) by adding `libcluster_postgrex_notifications` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:libcluster_postgrex_notifications, "~> MAJ.MIN"}
  ]
end
```

You can determine the latest version by running `mix hex.info libcluster_postgrex_notifications` in
your shell, or by going to the `libcluster_postgrex_notifications` [page on Hex.pm](https://hex.pm/packages/libcluster_postgrex_notifications).

## Usage

Add 

```elixir
config :libcluster,
  topologies: [
    postgrex_notifications_example: [
      strategy: Cluster.Strategy.PostgrexNotifications,
      config: [
        channel: "libcluster"
      ]
    ]
  ]
```
