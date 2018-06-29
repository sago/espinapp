module ProductsHelper
  def get_product_name(product_id)    
    Product.find(product_id).name
  end
  def get_product_type(product_id)    
    Product.find(product_id).product_type
  end
end
