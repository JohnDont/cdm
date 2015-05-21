module ApplicationHelper
  def body_class
    'page-' + params[:controller].gsub('/', '-') + '-' + params[:action]
  end
end
