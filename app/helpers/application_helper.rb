# coding: utf-8
module ApplicationHelper

  def owner?(item)
    return false if item.blank? or current_user.blank?
    item.user_id == current_user.id
  end

  def admin?(user = nil)
    user ||= current_user
    return false if user.blank?
    user.has_role? :admin
  end

  def render_page_title
      title = @page_title ? "#{SITE_NAME} | #{@page_title}" : SITE_NAME rescue "SITE_NAME"
      content_tag("title", title, nil, false)
  end

  def render_body_tag
    class_attribute = ["#{controller_name}-controller","#{action_name}-action"].join(" ")
    id_attribute = (@body_id)? " id=\"#{@body_id}-page\"" : ""

#     raw(%Q|<!--[if lt IE 7 ]>
# <body class="#{class_attribute} ie6"><![endif]-->
# <!--[if gte IE 7 ]>
# <body class="#{class_attribute} ie"><![endif]-->
# <!--[if !IE]>-->
# <body#{id_attribute} class="#{class_attribute}">
# <!--<![endif]-->|)

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

  def render_list(list=[], options={})
    if list.is_a? Hash
      options = list
      list = []
    end

    yield(list) if block_given?
    
    list_type ||= "ul"
    
    if options[:type] 
      if ["ul", "dl", "ol"].include?(options[:type])
        list_type = options[:type]
      end
    end

    ul = TagNode.new(list_type, :id => options[:id], :class => options[:class] )
    ul.addClass("unstyled") if (options[:type] && options[:type] == "unstyled")

    list.each_with_index do |content, i|
      item_class = []
      item_class << "first" if i == 0
      item_class << "last" if i == (list.length - 1)

      item_content = content
      item_options = {}

      if content.is_a? Array
        item_content = content[0]
        item_options = content[1]
      end

      if item_options[:class]
        item_class << item_options[:class]
      end

      link = item_content.match(/href=(["'])(.*?)(\1)/)[2] rescue nil

      if ( link && current_page?(link) ) || ( @current && @current.include?(link) )
        item_class << "active"
      end

      item_class = (item_class.empty?)? nil : item_class.join(" ")
      ul << li = TagNode.new('li', :class => item_class )
      li << item_content
    end

    return ul.to_s
  end

  def timeago(time, options = {})
    options[:class] 
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:abbr, "", options.merge(:title => time.iso8601)) if time
  end

  # Composite pattern
  class TagNode
    include ActionView::Helpers::TagHelper

    def initialize(name, options = {})
      @name = name.to_s
      @attributes = options
      @children = []
    end

    def addClass(x)
      if @attributes[:class].blank?
        @attributes[:class] = x.to_s
      else
        @attributes[:class] = @attributes[:class] + " #{x}"
      end
    end

    def to_s
      value = @children.each { |c| c.to_s }.join
      content_tag(@name, value.to_s, @attributes, false)
    end

    def <<(tag_node)
      @children << tag_node
    end
  end
  
end
