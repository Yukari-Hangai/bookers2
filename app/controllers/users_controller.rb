class UsersController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = current_user
  end

  def index
    @book = Book.new
    @books= Book.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body,)
  end

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
