# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

j = Array.new
j.push(Joueur.create pseudo: 'Mesta'    , is_active: true )
j.push(Joueur.create pseudo: 'Vora'     , is_active: true )
j.push(Joueur.create pseudo: 'Margotier', is_active: false)
j.push(Joueur.create pseudo: 'Marie'    , is_active: true )

c = Array.new
c.push(Category.create nom: 'Loup'          , question: 'Qui a les dents les plus longues ?')
c.push(Category.create nom: 'Innocent'      , question: 'Qui est le plus innocent ?')
c.push(Category.create nom: 'Pseudo'        , question: 'Qui a le meilleur pseudo ?')
c.push(Category.create nom: 'Popularité'    , question: 'Quel est le joueur le plus populaire ?')
c.push(Category.create nom: 'Spécialité'    , question: 'Qui joue la meilleur spécialité ?')
c.push(Category.create nom: 'Argumentateur' , question: 'Qui est le plus convaincant ?')
c.push(Category.create nom: 'Invisible'     , question: 'Lequel de ces joueurs est le plus invisible ?')
c.push(Category.create nom: 'Sale'          , question: "Lequel de ces joueurs est le plus sale ?")
c.push(Category.create nom: 'Présent'       , question: 'Quel est le joueur le plus présent ?')

j.each do |jn|
  c.each do |cn|
    JoueurCategory.create joueur: jn, category: cn, elo: 1200
  end
end

Admin.create! email: "mesta@test.fr", password: "test1234", password_confirmation: "test1234"
