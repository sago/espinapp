class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @users = User.all
    @products = Product.all
    @clients = Client.all
  end

  private
  def check_role
    @role = user_signed_in? ? current_user.role.downcase : nil
  end

end
