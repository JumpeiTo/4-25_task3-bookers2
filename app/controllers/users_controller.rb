# usersコントローラー

class UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def index
  end
end
