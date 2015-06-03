class SongsController < ApplicationController
  def new
    @song = Song.new

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def create
    @song = Song.new song_params
    @song.user = current_user

    respond_to do |format|
      if @song.save
        format.html { redirect_to share_song_path(@song) }
        format.js { render layout: false }
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def share
    @song = Song.find params[:id]
  end

  private

    def song_params
      params.require(:song).permit(:url)
    end
end
