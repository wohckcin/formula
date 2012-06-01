# coding: utf-8
module TopicsHelper
  def render_topic_node_select_tag(topic)
    return if topic.blank?
    grouped_collection_select :topic, :node_id, Section.all,
                    :sorted_nodes, :name, :id, :name, {value: topic.node_id,
                    include_blank: true, prompt: t('topics.select_node')}, class: 'span2 chosen'
  end
end
