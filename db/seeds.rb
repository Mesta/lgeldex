Admin.create! email: "aruno_black@hotmail.fr" , password: "12Vorap%Da6Beast#" , password_confirmation: "12Vorap%Da6Beast#"
Admin.create! email: "contact@mesta.fr"       , password: "lgelmash42$"       , password_confirmation: "lgelmash42$"

modes = ["Normal écrit", "Sérieux écrit", "Oral"]
m = Array.new
modes.each do |mode|
  m.push(Mode.create nom: mode)
end

pseudos = ["Absys", "Acmefish", "Act", "Algor", "Animarthur", "Anniouchka", "antoinehar", "Anyah", "Appolina",
           "August", "Baloolours", "Blaked", "Bovin", "Breathease", "Bubu", "Callye", "Daphedel", "Desperefra",
           "Deusgladis", "Dingo", "Disturbed", "Easton", "Enayrlay", "Egerie", "Regence", "Eldone", "Eydoole",
           "Ewells", "Eye", "Freia", "Furst", "Gabouuu", "Georgi", "Grisby", "Hachinesse", "Ikas",
           "Jamijams", "Kallan", "Katakani", "Kaynes", "Keyman", "Klashnikov", "Komie", "Kractus", "Ksys", "Kygo",
           "Liah", "Libertaire", "Lisouille", "Lukee", "Lycanmoi", "Lycano", "Malmhaus", "Manngue", "Margauw",
           "Milenko", "Moscow", "Nebbu", "Offset", "Ollyun", "Oxyde", "Patchenkoo", "Praskovia", "Preda", "Rejane",
           "Rickasley", "Ricks", "Rinaa", "Schizof", "Schkru", "Serleenaa", "Srie", "Stecat", "Slydenko", "Tallowisp",
           "Strident", "Togame", "Vegeta", "Vorapsak", "Worldclass", "Yes"]
j = Array.new
pseudos.each do |pseudo|
  j.push(Joueur.create pseudo: pseudo , is_active: true)
end

jm = Array.new
jm.push(JoueurMode.create joueur: j[0], mode: m[0])
jm.push(JoueurMode.create joueur: j[1], mode: m[0])
jm.push(JoueurMode.create joueur: j[2], mode: m[0])
jm.push(JoueurMode.create joueur: j[3], mode: m[0])
jm.push(JoueurMode.create joueur: j[4], mode: m[0])
jm.push(JoueurMode.create joueur: j[5], mode: m[0])
jm.push(JoueurMode.create joueur: j[0], mode: m[1])
jm.push(JoueurMode.create joueur: j[1], mode: m[1])
jm.push(JoueurMode.create joueur: j[3], mode: m[1])
jm.push(JoueurMode.create joueur: j[5], mode: m[1])
jm.push(JoueurMode.create joueur: j[1], mode: m[2])
jm.push(JoueurMode.create joueur: j[2], mode: m[2])
jm.push(JoueurMode.create joueur: j[3], mode: m[2])
jm.push(JoueurMode.create joueur: j[4], mode: m[2])

c = Array.new
c.push(Category.create nom: 'Loup'          , question: 'Qui a les dents les plus longues ?', is_serious: true)
c.push(Category.create nom: 'Innocent'      , question: 'Qui est le plus innocent ?', is_serious: true)
c.push(Category.create nom: 'Pseudo'        , question: 'Qui a le meilleur pseudo ?', is_serious: false)
c.push(Category.create nom: 'Popularité'    , question: 'Quel est le joueur le plus populaire ?', is_serious: false)
c.push(Category.create nom: 'Spécialité'    , question: 'Qui joue la meilleur spécialité ?', is_serious: true)
c.push(Category.create nom: 'Argumentateur' , question: 'Qui est le plus convaincant ?', is_serious: true)
c.push(Category.create nom: 'Invisible'     , question: 'Lequel de ces joueurs est le plus invisible ?', is_serious: false)
c.push(Category.create nom: 'Sale'          , question: "Lequel de ces joueurs est le plus sale ?", is_serious: false)
c.push(Category.create nom: 'Présent'       , question: 'Quel est le joueur le plus présent ?', is_serious: false)

c.each do |categ|
  jm.each do |joueur_mode|
    JoueurModesCategory.create joueur_mode: joueur_mode, category: categ, elo: 1200
  end
end


