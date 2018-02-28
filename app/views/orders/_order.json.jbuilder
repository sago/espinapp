json.extract! order, :id, :client_id, :user_id, :quantity, :product_id, :payment, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
