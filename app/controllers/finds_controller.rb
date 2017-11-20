class FindsController < ApplicationController
  before_action :login_user, only: :show

  def show
    @user = User.find_by(uuid: params[:search])
    if @user
      # redirect_to user_path(@user) ホントはUserページに飛ばしてやりたい感じ
      friend_request = @user.friend_requests.build(request_user_id: current_user.id)
      if friend_request.save
        flash[:success] = 'Good! Send Your Friend Request!!'
        redirect_to root_path
      else
        flash[:error] = friend_request.errors
        redirect_to find_path
      end
    end
  end
end
