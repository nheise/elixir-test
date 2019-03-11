defmodule PubSub.AccountStore do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def get() do
    GenServer.call(__MODULE__, :get)
  end

  def init(_) do
    Phoenix.PubSub.subscribe(:accounts, "accounts_updates")
    {:ok, %{}}
  end

  def handle_call(:get, _, state) do
    {:reply, state, state}
  end

  def handle_info({:in, number, quantity}, state) do
    IO.puts("Deposit account #{number} (#{quantity})")

    updated_state = state
      |> Map.update(number, quantity, &(&1 + quantity))

    {:noreply, updated_state}
  end

  def handle_info({:out, number, quantity}, state) do
    IO.puts("Pay out #{number} (#{quantity})")

    updated_state = state
      |> Map.update(number, 0, &(&1 - quantity))
      |> Enum.reject(fn({_, v}) -> v <= 0 end)
      |> Map.new

    {:noreply, updated_state}
  end
end
