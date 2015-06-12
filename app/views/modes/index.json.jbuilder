json.array!(@modes) do |mode|
  json.extract! mode, :id, :nom
  json.url mode_url(mode, format: :json)
end
