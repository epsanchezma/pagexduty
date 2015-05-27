defmodule Pagexduty do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    service_key = Application.get_env(:pagerduty, :service_key) || System.get_env("PAGERDUTY_SERVICE_KEY")

    children = [
      # Define workers and child supervisors to be supervised
      worker(Pagexduty.Server, [service_key])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pagexduty.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
