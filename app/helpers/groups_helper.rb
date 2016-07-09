module GroupsHelper
  def render_group_title(group)
    simple_format(truncate(group.title, lenth:20))
  end

  def render_group_content(group)
    simple_format(truncate(group.description, lenth:100))
  end
end
