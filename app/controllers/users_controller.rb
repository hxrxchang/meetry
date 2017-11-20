class UsersController < ApplicationController
  before_action :mypage, only: :show

  def new
    @user = User.new
  end

  # TODO: ほんとはUserのShowページを用意してあげてそこから申請したい
  def show
    @receive_requests = current_user.friend_requests
    @send_requests = FriendRequest.where(request_user_id: current_user.id)
  end

  # TODO: User IDのみで登録しているメールに再度ログインURLを発行して送る
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
    if @user.present?
      sign_in(@user)
    else
      flash[:error] = "Token Invalid"
      redirect_to root_path
    end
  end

 private

  def user_params
    params.require(:user).permit(:uuid, :email)
  end

  def mypage
    if params[:id] != current_user.id.to_s
      flash[:error] = "MyPage Only!"
      redirect_to root_path
    end
  end
end
