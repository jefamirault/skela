json.array!(@personal_profiles) do |personal_profile|
  json.extract! personal_profile, :id, :name, :favorite_color_id
  json.url personal_profile_url(personal_profile, format: :json)
end
