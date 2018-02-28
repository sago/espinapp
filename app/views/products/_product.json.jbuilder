json.extract! product, :id, :name, :price_unit, :type, :created_at, :updated_at
json.url product_url(product, format: :json)
