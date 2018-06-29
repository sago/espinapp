module ApplicationHelper

  def get_clients
    Client.all.pluck(:full_name, :id)
  end

  def get_repartidor
    check_role
    if @role == "admin"
      User.all.pluck(:full_name, :id)
    else
      [ [ current_user.full_name, current_user.id ]]
    end
    
  end

  def get_products
    Product.all.pluck(:name, :id)
  end

  private
  def check_role
    @role = user_signed_in? ? current_user.role.downcase : nil
  end

end
