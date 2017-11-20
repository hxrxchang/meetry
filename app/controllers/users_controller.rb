class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_email
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    token = params[:token]
    @user = User.find_from_token(token)
    if @user.blank?
      redirect_to root_path
    end
  end

 private
  def user_params
    params.require(:user).permit(:uuid, :email)
  end
end
