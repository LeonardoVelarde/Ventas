json.array!(@products) do |product|
  json.extract! product, :id, :name, :model, :description, :whole_sale_price, :retail_price, :amount
  json.url product_url(product, format: :json)
end
