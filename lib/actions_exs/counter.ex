defmodule ActionsExs.Counter do
  use Ecto.Schema
  import Ecto.Changeset

  import Ecto.Query, only: [from: 2]

  schema "counters" do
    field :click, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(counter \\ %__MODULE__{}, attrs \\ %{}) do
    counter
    |> cast(attrs, [:click])
    |> validate_required([:click])
  end

  def get_click(query \\ __MODULE__), do: from(c in query, order_by: c.inserted_at)
end
