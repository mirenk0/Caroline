defmodule Naive.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DynamicSupervisor,
      strategy: :one_for_one,
      name: Naive.DynamicSymbolSupervisor
    ]

    opts = [strategy: :one_for_one, name: Naive.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
