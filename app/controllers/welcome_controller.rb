class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      load_songs

      respond_to do |format|
        format.html { render :explore }
        format.js { render :explore, layout: false }
      end
    end
  end

  def explore
    load_songs

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  private
  def sort_dates
    case params[:sort]
    when 'today'
      [Date.today, Date.today]
    when 'last_week'
      [Date.today, Date.today-1.week]
    when 'last_month'
      [Date.today, Date.today-1.month]
    when 'last_year'
      [Date.today, Date.today-1.year]
    when 'lifetime'
      [nil, nil]
    else
      [Date.today, Date.today-1.week]
    end
  end

  def load_songs
    page = params[:page] || 1
    per = params[:per] || 6
    dates = sort_dates

    if params['top']
      @top_offset = (page.to_i-1)*per.to_i
      @songs = Song.top(dates.first, dates.last)
    else
      @songs = Song.latest
    end

    if category = params[:category]
      unless category == "all"
        category_id = Category.friendly.only(:id).find(category).id
        @songs = @songs.where(category_id: category_id)
      end
    end

    if for_challenge = params[:for_challenge]
      @songs = @songs.where(for_challenge: true)
    end

    @songs = @songs.page(page).per(per)
  end
end
