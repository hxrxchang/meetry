class AuthenticatesController < ApplicationController
  def new
    @request = current_user.friend_requests.yet.last
  end

  def update
    @request = current_user.friend_requests.yet.last
    @request.update(request_params)
    if @request.save
      flash[:success] = "Success Authenticate Status Change!"
      # redirect_to @user
      redirect_to root_path
    else
      flash[:error] = @request.errors
      render :new
    end
  end

  private

  def request_params
    params.require(:friend_request).permit(:request_status)
  end
end
