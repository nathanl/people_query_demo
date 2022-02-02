defmodule Mix.Tasks.QueryPeople do
  use Mix.Task
  import Ecto.Query
  alias People.People.Person

  def run(_) do
    Mix.Task.run("app.start")

    today = Date.utc_today()

    base_query =
      from(person in Person,
        select: %{
          name: person.name,
          lifespan:
            fragment(
              # If person is alive, calculate lifespan until today
              "COALESCE(?, ?) - ? AS lifespan",
              person.death,
              ^today,
              person.birth
            )
        }
      )

    base_query
    |> order_by([{:asc, fragment("lifespan")}])
    |> People.Repo.all()
    |> IO.inspect(label: "ascending by lifespan ")

    base_query
    |> order_by([{:desc, fragment("lifespan")}])
    |> People.Repo.all()
    |> IO.inspect(label: "descending by lifespan ")
  end
end
