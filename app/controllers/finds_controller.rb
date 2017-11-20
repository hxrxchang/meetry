class FindsController < ApplicationController

  def show
    puts params[:search]
    @user = User.find_by(uuid: params[:search])
  end
end
