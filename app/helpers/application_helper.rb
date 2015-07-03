module ApplicationHelper
  def body_class
    name = 'page-' + params[:controller].gsub('/', '-') + '-' + params[:action]
    if params[:controller] == "users" and params[:action] == "show"
      name += " #{name}-#{params[:id]}"
    end
    name
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def fb_share_link url
    "https://www.facebook.com/sharer/sharer.php?u=#{url}&app_id=#{Figaro.env.facebook_app_id}"
  end

  def tw_share_link url
    "https://twitter.com/intent/tweet?url=#{url}"
  end

  def facebook_shares url
    begin
      url = "http://graph.facebook.com/?id=#{url}"
      return JSON.load(open(url))['shares'] || 0
    rescue
      return nil
    end
  end

  def twitter_shares url
    begin
      url = "https://cdn.api.twitter.com/1/urls/count.json?url=#{url}"
      return JSON.load(open(url))['count'] || 0
    rescue
      return nil
    end
  end

  def categories_menu_extra_class
    (current_page?(controller: :welcome, action: :explore) && params[:category] != 'all' && !params[:category].blank?) ? 'active' : ''
  end

  def challenge_link_extra_class
    (current_page?(controller: :welcome, action: :challenge) ? 'active' : '')
  end
end
