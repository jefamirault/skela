json.array!(@developer_log_entries) do |developer_log_entry|
  json.extract! developer_log_entry, :id, :title, :text, :datetime, :user_id
  json.url developer_log_entry_url(developer_log_entry, format: :json)
end
