json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :string, :message_count, :integer
  json.url user_url(user, format: :json)
end
