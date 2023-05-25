# usersコントローラー

class UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(current_user.id)
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
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
  
  # 他のユーザーからのアクセスを制限
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  

end
