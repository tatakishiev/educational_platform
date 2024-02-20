defmodule EducationalPlatform.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EducationalPlatformWeb.Telemetry,
      EducationalPlatform.Repo,
      {DNSCluster, query: Application.get_env(:educational_platform, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EducationalPlatform.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EducationalPlatform.Finch},
      # Start a worker by calling: EducationalPlatform.Worker.start_link(arg)
      # {EducationalPlatform.Worker, arg},
      # Start to serve requests, typically the last entry
      EducationalPlatformWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EducationalPlatform.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EducationalPlatformWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
