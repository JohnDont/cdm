class UsersController < ApplicationController
  def show
    page = params[:page] || 1
    per = params[:per] || 6

    @user = User.find params[:id]
    @songs = @user.songs.latest.page(page).per(per)

    respond_to do |format|
      format.html
      format.js { render template: 'welcome/index', layout: false }
    end
  end
end
