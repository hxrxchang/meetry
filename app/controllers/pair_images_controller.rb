# User to User Memory Picture
class PairImagesController < ApplicationController
  before_action :login_user
  def new
    @pair_image = PairImage.new
  end

  def create
    @pair_image = PairImage.new(pair_image_params)
    if @pair_image.save
      session[:img_id] = @pair_image.id
      redirect_to find_path
    else
      render :new
    end
  end

  private

  def pair_image_params
    params.require(:pair_image).permit(:image)
  end
end
