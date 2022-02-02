defmodule People.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :birth, :date
    field :death, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :birth, :death])
    |> validate_required([:name, :birth])
  end
end
