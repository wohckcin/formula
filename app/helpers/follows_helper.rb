module FollowsHelper
  # Followable
  def followable_tag(followable)

    if current_user && current_user != followable
      if current_user.following?(followable)
        label = content_tag('span', 'Following')
        state = 'following'
      else
        label = content_tag('span', 'Follow')
        state = 'follow'
      end
      link_to(label, '#', 'data-type' => followable.class, 'data-id' => followable.id, class: state, onclick: 'return App.followable(this);')
    end
  end
end
