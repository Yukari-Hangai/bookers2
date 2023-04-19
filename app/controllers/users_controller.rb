class UsersController < ApplicationController
  def new
    @book = Book.new
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    @books= Book.all
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id  == current_user.id
     redirect_to user_path(@user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(@user.id)
    end
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body,)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,)
  end
  
end
