class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  def index
    if @role == "admin"
      @orders = Order.where(created_at: Date.today.all_day)
    end    
  end

  private
  def check_role
    @role = user_signed_in? ? current_user.role.downcase : nil
  end
end
