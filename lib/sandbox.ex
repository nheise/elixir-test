defmodule Sandbox do
  @moduledoc """
  Documentation for Sandbox.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sandbox.hello()
      :world

  """
  def hello do
    :world
  end

  def plusOne( x ) do
    x + 1
  end

  def gimeOne( x ) do
    plusOne(x)
  end
end
