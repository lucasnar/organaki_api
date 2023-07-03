# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OrganakiApi.Repo.insert!(%OrganakiApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias OrganakiApi.Repo
alias OrganakiApi.Tags.Tag

tag_names = [
  "agricultura familiar",
  "agricultura regenerativa",
  "agroecológico",
  "agrofloresta",
  "agroturismo",
  "alimentos frescos",
  "artesanal",
  "biodiversidade",
  "certificado",
  "compostagem",
  "comunidade sustentável",
  "conservação de biodiversidade",
  "cultivo hidropônico",
  "embalagens sustentáveis",
  "empreendimento social",
  "energia renovável",
  "fair trade",
  "feira orgânica",
  "horta urbana",
  "manejo sustentável",
  "orgânico",
  "permacultura",
  "reciclagem",
  "redução de resíduos",
  "reutilização de água",
  "sem crueldade",
  "sustentável",
  "vegano",
  "zero plástico"
]

for tag_name <- tag_names do
  %Tag{}
  |> Tag.changeset(%{name: tag_name})
  |> Repo.insert!()
end
