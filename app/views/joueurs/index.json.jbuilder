json.array!(@joueurs) do |joueur|
  json.extract! joueur, :id
  json.url joueur_url(joueur, format: :json)
end
