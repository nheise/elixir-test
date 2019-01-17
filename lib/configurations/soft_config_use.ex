defmodule SoftConfigUse do

  def showConfig do
    IO.puts(get_config())
  end

  defp get_config do
    Application.get_env(:sandbox, :hard_soft_config_test)
  end
end
