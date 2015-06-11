json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :import_id, :product_id, :price, :amount
  json.url delivery_url(delivery, format: :json)
end
