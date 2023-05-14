# usersコントローラー

class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(current_user.id)
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end
  
  
   private
  # ストロングパラメーター
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
