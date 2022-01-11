class UsersController < ApplicationController
  before_action :authenticate_user!
  
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
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have update user successfully.'
    else
    render :edit
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
