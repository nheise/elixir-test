defmodule GenStageMaschine.Application do

  use Application
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GenStageMaschine.Emitter, [0]),
      worker(GenStageMaschine.Worker, []),
      worker(GenStageMaschine.DataSink, [], id: 1),
      worker(GenStageMaschine.DataSink, [], id: 2)
    ]

    opts = [strategy: :one_for_one, name: GenStageMaschine.Supervisor]
    Supervisor.start_link(children, opts)

  end
end
