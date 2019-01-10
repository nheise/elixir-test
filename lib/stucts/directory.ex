defmodule Directory do
  @enforce_keys [:path]
  defstruct path: nil, children: []

  @type t(path, children) :: %Directory{path: path, children: children}
  @type t :: %Directory{path: String.t, children: list}
end
