class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    if @role == "admin"
      @users = User.all
      @products = Product.all
      @clients = Client.all
    else
      redirect_to root_path
    end
  end

  def reports
    if @role == "admin"
      @users = User.all
      @products = Product.all
      @clients = Client.all
    else
      redirect_to root_path
    end
  end

  def resource_datatable
    @option = params[:tab]
    @resource = Order.all    
    respond_to do |format|
      format.js
    end

  end

  private
  def check_role
    @role = user_signed_in? ? current_user.role.downcase : nil
  end

end
