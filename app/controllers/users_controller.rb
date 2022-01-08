class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.book.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def index
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.page(params[:page]).reverse_order
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
