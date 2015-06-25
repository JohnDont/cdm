class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:share]
  before_filter :load_song, only: [:share, :vote, :play]

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
        format.js { render :new, layout: false }
      end
    end
  end

  def share
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def vote
    respond_to do |format|
      if current_user.can_vote_for?(@song)
        current_user.vote_for(@song)
        format.js { render layout: false }
      else
        @error = "You have already voted for this song."
        format.js { render layout: false }
      end
    end
  end

  def play
    current_user.play @song

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private
    def load_song
      @song = Song.find params[:id]
    end

    def song_params
      params.require(:song).permit(:url, :category_id)
    end
end
