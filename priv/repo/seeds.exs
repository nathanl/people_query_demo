# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     People.Repo.insert!(%People.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias People.People.Person

[
  %Person{name: "A", birth: ~D[1920-01-01], death: ~D[1995-06-01]},
  %Person{name: "B", birth: ~D[1950-01-01], death: ~D[2020-08-01]},
  %Person{name: "C", birth: ~D[2020-01-01], death: nil}
]
|> Enum.each(fn p ->
  People.Repo.insert!(p)
end)
