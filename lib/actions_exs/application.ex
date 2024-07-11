defmodule ActionsExs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ActionsExsWeb.Telemetry,
      ActionsExs.Repo,
      {DNSCluster, query: Application.get_env(:actions_exs, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ActionsExs.PubSub},
      # Start a worker by calling: ActionsExs.Worker.start_link(arg)
      # {ActionsExs.Worker, arg},
      # Start to serve requests, typically the last entry
      ActionsExsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ActionsExs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ActionsExsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
