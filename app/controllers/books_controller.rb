# booksコントローラー

class BooksController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  
  # New book投稿
  def new
    
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  # ブック一覧
  def index
    @books = Book.all
    @book = Book.new
  end

  # ブック詳細
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @books = @user.books.all
    @bookf = Book.new
  end
  
  # 削除
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  # 編集
  def edit 
    @book = Book.find(params[:id])
  end
  
  # 更新
   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  # 他のユーザーからのアクセスを制限
  def is_matching_login_user
    book = Book.find(params[:id])
    user = book.user
    unless user.id == current_user.id
      redirect_to index
    end
  end
  
end
