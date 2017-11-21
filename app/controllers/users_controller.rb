class UsersController < ApplicationController
  before_action :mypage_or_accept_user, only: :show

  def new
    @user = User.new
  end

  # TODO: ほんとはUserのShowページを用意してあげてそこから申請したい
  def show
    if user_signed_in? && current_user.id == params[:id].to_i
      @receive_requests = FriendRequest.where(friend_id: current_user.id)
      @send_requests = FriendRequest.where(request_user_id: current_user.id)
      @social_account = SocialAccount.new
    else
      @user = User.find(params[:id])
    end
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
    @user_information = UserInformation.new(gmail: @user.email)
    if @user.present?
      sign_in(@user)
    else
      flash[:error] = "Token Invalid"
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @user.user_information.update(user_information_params)
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

 private
  def user_params
    params.require(:user).permit(:uuid, :email)
  end

  def user_information_params
    params.require(:user_information).permit(:user_id, :tel, :gmail, :image)
  end

  def mypage_or_accept_user
    not_mypage = params[:id] != current_user.id.to_s
    friends = FriendRequest.where(request_user_id: current_user.id, request_status: :accept)
    friend = !!friends.find_by(id: params[:id])

    if [not_mypage, !friend].all?
      flash[:error] = "MyPage Only!"
      redirect_to root_path
    end
  end
end
