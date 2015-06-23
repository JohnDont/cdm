class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      page = params[:page] || 1
      per = params[:per] || 6
      dates = sort_dates

      if params['top']
        @top_offset = (page.to_i-1)*per.to_i
        @songs = Song.top(dates.first, dates.last)
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
end
