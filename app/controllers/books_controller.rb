# booksコントローラー

class BooksController < ApplicationController
  
  # New book投稿
  def new
    
  end
  
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path(@book)
    else
      render :new
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
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
