class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  def index
    if @role == "admin"
      @date = params[:date].present? ? params[:date].to_date : Date.today
      @orders = Order.where("created_at >=  :start_date AND created_at <= :end_date", start_date:  @date.beginning_of_day.utc, end_date: @date.end_of_day.utc)
    end
  end

  private
  def check_role
    @role = user_signed_in? ? current_user.role.downcase : nil
  end
end
