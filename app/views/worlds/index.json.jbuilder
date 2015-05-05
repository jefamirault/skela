json.array!(@worlds) do |world|
  json.extract! world, :id
  json.url world_url(world, format: :json)
end
