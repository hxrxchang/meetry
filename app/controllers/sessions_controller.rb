class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(uuid: params[:session][:uuid])
    if @user
      flash[:success] = "Send Your Email!"
      @user.send_email
      redirect_to root_path
    else
      flash[:error] = "Not Found User"
      render :new
    end
  end
end
