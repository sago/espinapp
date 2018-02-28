json.extract! client, :id, :full_name, :business, :address, :phone, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
