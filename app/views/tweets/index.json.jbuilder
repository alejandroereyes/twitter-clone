json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :message, :string, :belongs_to, :users
  json.url tweet_url(tweet, format: :json)
end
