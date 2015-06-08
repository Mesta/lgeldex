# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

j1 = Joueur.create pseudo: 'Mesta', is_active: true
j2 = Joueur.create pseudo: 'Vora', is_active: true
j3 = Joueur.create pseudo: 'Margotier', is_active: false
j4 = Joueur.create pseudo: 'Marie', is_active: true

c1 = Category.create nom: 'Loup', question: 'Qui a les dents les plus longues ?'
c2 = Category.create nom: 'Innocent', question: 'Qui est le plus innocent ?'

JoueurCategory.create joueur: j1, category: c1, elo: 1178
JoueurCategory.create joueur: j2, category: c1, elo: 1674
JoueurCategory.create joueur: j3, category: c1, elo: 1823
JoueurCategory.create joueur: j4, category: c1, elo: 1145
JoueurCategory.create joueur: j1, category: c2, elo: 1294
JoueurCategory.create joueur: j2, category: c2, elo: 1463
JoueurCategory.create joueur: j3, category: c2, elo: 1354
JoueurCategory.create joueur: j4, category: c2, elo: 1672

Admin.create! email: "mesta@test.fr", password: "test1234", password_confirmation: "test1234"