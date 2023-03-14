class BooksController < ApplicationController
  
  def new
    @books = Book.all
  end
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    # トップ画面へリダイレクト
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
    
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
