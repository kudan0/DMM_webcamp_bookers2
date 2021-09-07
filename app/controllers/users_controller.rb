class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new

  end


  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to '/users'

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end