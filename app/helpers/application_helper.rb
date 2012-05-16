# coding: utf-8
module ApplicationHelper

  def render_page_title
      title = @page_title ? "#{SITE_NAME} | #{@page_title}" : SITE_NAME rescue "SITE_NAME"
      content_tag("title", title, nil, false)
  end

  def render_body_tag
    class_attribute = ["#{controller_name}-controller","#{action_name}-action"].join(" ")
    id_attribute = (@body_id)? " id=\"#{@body_id}-page\"" : ""

    raw(%Q|<!--[if lt IE 7 ]>
<body class="#{class_attribute} ie6"><![endif]-->
<!--[if gte IE 7 ]>
<body class="#{class_attribute} ie"><![endif]-->
<!--[if !IE]>-->
<body#{id_attribute} class="#{class_attribute}">
<!--<![endif]-->|)

  end
    
  def notice_message
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", class: "close", "data-dismiss" => "alert") + message, class: "alert fade in alert-#{type}")
      flash_messages << text if message.is_a?String # fix Devise timeoutable return true in flash
    end
    flash_messages.join("\n").html_safe
  end


  def render_breadcrumb
    return "" if @breadcrumbs.size <= 0
    prefix = "".html_safe
    crumb = "".html_safe

    @breadcrumbs.each_with_index do |c, i|
      breadcrumb_class = []
      breadcrumb_class << "first" if i == 0
      breadcrumb_class << "last active" if i == (@breadcrumbs.length - 1)

      if i == (@breadcrumbs.length - 1)
        breadcrumb_content = c
      else
        breadcrumb_content = c + content_tag(:span, "/", class: "divider")
      end

      crumb += content_tag(:li, breadcrumb_content , class: breadcrumb_class )
    end
    return prefix + content_tag(:ul, crumb, class: "breadcrumb menu clearfix")
  end

end
