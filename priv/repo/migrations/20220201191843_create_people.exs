defmodule People.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :birth, :date
      add :death, :date

      timestamps()
    end
  end
end
