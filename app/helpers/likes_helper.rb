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
        icon = content_tag("i", "", class: "icon-heart icon-large active")
        icon_reply = content_tag("i", "", class: "icon-heart active")
      else
        title = "喜欢"
        state = ""
        icon = content_tag("i", "", class: "icon-heart icon-large")
        icon_reply = content_tag("i", "", class: "icon-heart")
      end
      if likeable.class.to_s == 'Topic'
        like_label = raw "#{icon}<strong>#{label}</strong>"
      elsif likeable.class.to_s == 'Reply'
        like_label = raw "#{icon_reply}"
      end
      link_to(like_label,"", title: title, rel: "twipsy", 'data-count' => likeable.likes_count,
              'data-state' => state, 'data-type' => likeable.class, 'data-id' => likeable.id,
              class: 'likeable', onclick: "return App.likeable(this);")
    else
      if likeable.class.to_s == 'Topic'
        raw "#{content_tag("i", "", class: "icon-heart icon-large")}<strong>#{label}</strong>"
      elsif likeable.class.to_s == 'Reply'
        raw "#{content_tag("i", "", class: "icon-heart")}"
      end
    end
  end

  def reply_likeable_tag(likeable)
    return '' if likeable.blank?

    label = "#{likeable.likes_count}"
    icon = content_tag("i", "", class: "icon-heart")
    like_label = raw "#{icon} <strong>#{label}</strong>"
    if likeable.likes_count == 0
      content_tag('span', like_label, id: likeable.id, class: 'reply-likeable', style: 'display:none;')
    else
      content_tag('span', like_label, id: likeable.id, class: 'reply-likeable')
    end   
  end

end
