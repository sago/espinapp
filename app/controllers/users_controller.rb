class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_role
  def new
    @user = User.new
  end

  def show
  end

  def create
    if @role == "admin"
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to "/admin", notice: 'El Usuario fue creado!' }
          format.json { render :show, status: :created, location: @story }
        else
          format.html { redirect_to new_user_path }
          format.json { render json: @story.errors, status: :unprocessable_entity }
        end
      end
    end
    
  end

  def edit
  end

  def update
    if @role == "admin"
      respond_to do |format|
        if @user.update(user_params_edit)
          format.html { redirect_to "/admin", notice: 'El Usuario fue actualizado!' }
          format.json { render :show, status: :created, location: @story }
        else
          format.html { redirect_to edit_user_path(@user) }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if @role == "admin"
      @user.destroy
      respond_to do |format|
        format.html { redirect_to "/admin", notice: 'El Usuario fue borrado!' }
        format.json { head :no_content }
      end
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find params[:id]
    end

    def user_params_edit
      params.require(:user).permit(:full_name, :last_name, :password, :email, :role)
    end

    def user_params
      params[:user] = {"full_name"=>params[:full_name], "last_name"=>params[:last_name], "email"=>params[:email],
                      "password"=>params[:password], "role"=> params[:role]}
      params.require(:user).permit(:full_name, :last_name, :password, :email, :role)
    end    
    def check_role      
      @role = user_signed_in? ? current_user.role.downcase : nil
    end
end
