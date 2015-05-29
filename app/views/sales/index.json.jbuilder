json.array!(@sales) do |sale|
  json.extract! sale, :id, :client_id, :type_name, :total_price
  json.url sale_url(sale, format: :json)
end
