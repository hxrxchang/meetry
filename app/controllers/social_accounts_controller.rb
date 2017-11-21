class SocialAccountsController < ApplicationController
  def create
    social_account = SocialAccount.new(social_params)
    social_account.user = current_user
    social_account.save!
  end

  def destroy
    SocialAccount.find(params[:id]).destroy
    flash[:success] = "success deleted!"
  end

  private

  def social_params
    params.require(:social_account).permit(:provider, :url)
  end
end
