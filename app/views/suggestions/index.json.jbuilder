json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :pseudo
  json.url suggestion_url(suggestion, format: :json)
end
