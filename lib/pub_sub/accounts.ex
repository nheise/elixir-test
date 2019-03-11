defmodule PubSubDemo.Accounts do
  @pubsub_name :accou
  @pubsub_topic "accounts_updates"

  def deposit(number, quantity) when is_integer(number) and is_integer(quantity) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:in, number, quantity})
  end

  def pay_out(number, quantity) when is_integer(number) and is_integer(quantity) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:out, number, quantity})
  end
end
