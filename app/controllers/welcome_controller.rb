class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      page = params[:page] || 1
      per = params[:per] || 6

      @songs = Song.order(created_at: :desc).page(page).per(per)
    end

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
end
