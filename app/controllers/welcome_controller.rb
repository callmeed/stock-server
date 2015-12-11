class WelcomeController < ApplicationController
  def index
    @image = Image.first
  end

  def license
  end

  def terms
  end

  def privacy
  end

  def contact
  end
end
