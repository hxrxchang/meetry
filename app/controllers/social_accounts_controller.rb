class SocialAccountsController < ApplicationController
  def new
    @social_account = SocialAccount.new
  end
end