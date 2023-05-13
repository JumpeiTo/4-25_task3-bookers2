# usersコントローラー

class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(current_user.id)
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def index
  end
  
  
   private
  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :profile_image, :introdction)
  end
  
end
