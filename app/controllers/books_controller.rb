class BooksController < ApplicationController
  
  def new
    @books = Book.all
  end
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データが正しく入力されていたらデータベースに保存するためのsaveメソッド実行
    if @book.save
    # フラッシュメッセージを定義しshowへリダイレクト
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    # データが正しく入力されていなかったらbooksへリダイレクト
    else
      @books = Book.all
      render :'books/index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    # データを受け取りアップデートするためのインスタンス作成
    @book = Book.find(params[:id])
    # データをアップデート
    if @book.update(book_params)
    # フラッシュメッセージを定義しshowへリダイレクト
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    # データが正しく入力されていなかったらeditへリダイレクト
    else
      render :'books/edit'
    end
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
