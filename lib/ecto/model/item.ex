defmodule MyEctoTest.Item do
  use MyEctoTest.Schema
  import Ecto.Changeset
  require Logger

  schema "item" do
    field :value, :integer
  end

  @doc false
  def changeset_new(item, params) do
    Logger.info("action=changeset_new, status=info, params=#{inspect(params)}")
    item
    |> cast(params, [:value])
    |> validate_required([:value])
  end

  @spec save(changeset :: Ecto.Changeset.t) :: String.t
  def save(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        MyEctoTest.Repo.insert changeset
      _ ->
        {:error, changeset}
    end
  end
end
