defmodule CompileTimeConfigUse do
  @config_text Application.get_env(:sandbox, :hard_soft_config_test)

  def showConfig do
    IO.puts(@config_text)
  end
end
