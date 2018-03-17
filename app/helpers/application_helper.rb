module ApplicationHelper

  def get_clients
    Client.all.pluck(:full_name, :id)
  end

  def get_repartidor
    User.where(role: "repartidor").pluck(:full_name, :id)
  end

  def get_products
    Product.all.pluck(:name, :id)
  end

  def get_product_name(product_id)
    name = Product.find product_id
    name.name
  end
end
