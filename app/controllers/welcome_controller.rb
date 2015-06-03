class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @songs = Song.order(created_at: :desc)
    end
  end
end
