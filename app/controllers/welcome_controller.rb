class WelcomeController < ApplicationController
  def index
    session[:token] ||= SecureRandom.hex[0,6].upcase
    @token = session[:token]
    @image = Image.first
  end

  def grid
    @images = Image.all
  end

  def license
  end

  def terms
  end

  def privacy
  end

  def contact
  end

  def subscribe
    @user = User.new(user_params)
    @user.save
    redirect_to browse_grid_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
