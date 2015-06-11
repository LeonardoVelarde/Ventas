json.array!(@imports) do |import|
  json.extract! import, :id, :provider, :total_price
  json.url import_url(import, format: :json)
end
