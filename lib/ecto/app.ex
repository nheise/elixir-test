defmodule MyEctoTest.App do

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      MyEctoTest.Repo
      # Starts a worker by calling: MegaWeb.Worker.start_link(arg)
      # {MegaWeb.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyEctoTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
