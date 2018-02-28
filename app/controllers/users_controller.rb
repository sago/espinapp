class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to "/admin" }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { redirect_to new_user_path }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/admin" }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { redirect_to edit_user_path(@user) }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params[:user] = {"first_name"=>params[:first_name], "last_name"=>params[:last_name], "email"=>params[:email],
                      "password"=>params[:password], "role"=> params[:role]}
      params.require(:user).permit(:first_name, :last_name, :password, :email, :role)
    end
end
