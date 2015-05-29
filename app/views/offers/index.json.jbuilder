json.array!(@offers) do |offer|
  json.extract! offer, :id, :product_id, :sale_id, :price, :amount
  json.url offer_url(offer, format: :json)
end
