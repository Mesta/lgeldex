json.array!(@categories) do |category|
  json.extract! category, :id, :nom, :question
  json.url category_url(category, format: :json)
end
