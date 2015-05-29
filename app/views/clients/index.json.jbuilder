json.array!(@clients) do |client|
  json.extract! client, :id, :name, :nit, :direction, :trusted
  json.url client_url(client, format: :json)
end
