class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      page = params[:page] || 1
      per = params[:per] || 6

      if params['top']
        @top_offset = (page.to_i-1)*per.to_i
        @songs = Song.top(Date.today, Date.today)
      else
        @songs = Song.latest
      end

      @songs = @songs.page(page).per(per)
    end

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end
end
