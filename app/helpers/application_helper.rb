module ApplicationHelper
  def body_class
    'page-' + params[:controller].gsub('/', '-') + '-' + params[:action]
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
end
