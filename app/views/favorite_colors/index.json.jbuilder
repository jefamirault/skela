json.array!(@favorite_colors) do |favorite_color|
  json.extract! favorite_color, :id
  json.url favorite_color_url(favorite_color, format: :json)
end
