json.array!(@plants) do |plant|
  json.extract! plant, :id, :name, :species, :birthday
  json.url plant_url(plant, format: :json)
end
