class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: t("common.access_denied")
  end
  before_filter :set_breadcrumbs

  protected

  # Breadcrumbs Methods
  def set_breadcrumbs
    @breadcrumbs = ["<a href='/'><i class='icon-home'></i></a>".html_safe]
  end

  def drop_breadcrumb(title=nil, url=nil)
    title ||= @page_title
    url ||= url_for
    if title
      @breadcrumbs.push("<a href=\"#{url}\">#{title}</a>".html_safe)
    end
  end

  def drop_page_title(title)
    @page_title = title
    return @page_title
  end

  def no_breadcrumbs
    @breadcrumbs = []
  end
  # ================
end
