class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => t('register.signed_up')
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :name, :surname, :password_confirmation)
  end
end
