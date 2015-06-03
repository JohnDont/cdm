class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @songs = Song.all
    end
  end
end
