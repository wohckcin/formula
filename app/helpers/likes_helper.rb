# coding: utf-8
module LikesHelper
  # Likeable
  def likeable_tag(likeable)
    return '' if likeable.blank?
    
    label = "#{likeable.likes_count}"

    if current_user
      if current_user.liked?(likeable)
        title = "取消喜欢"
        state = "liked"
        icon = content_tag("i", "", :class => "icon-heart icon-large active")
      else
        title = "喜欢"
        state = ""
        icon = content_tag("i", "", :class => "icon-heart icon-large")
      end
      like_label = raw "#{icon}<strong>#{label}</strong>"
      link_to(like_label,"",:title => title, :rel => "twipsy", 'data-count' => likeable.likes_count,
              'data-state' => state,'data-type' => likeable.class,'data-id' => likeable.id,
              :class => 'likeable', :onclick => "return App.likeable(this);")
    else
      raw "#{content_tag("i", "", :class => "icon-heart icon-large")}<strong>#{label}</strong>"
    end
  end

end
