class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  def index
  end

  private
  def check_role
    @role = user_signed_in? ? current_user.role.downcase : nil
  end
end
