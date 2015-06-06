json.array!(@joueurs) do |joueur|
  json.extract! joueur, :id, :pseudo, :is_active
  json.url joueur_url(joueur, format: :json)
end
