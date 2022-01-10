class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'You have update user successfully.'
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: 'You have update book successfully.'
    else
      @books = Book.find(params[:id])
      render :show
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
