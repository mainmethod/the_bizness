module ApplicationHelper
  
  def nav_link(link_text, link_path, icon)
  
  active_class = current_page?(link_path) ? 'active ' : ''
  icon = content_tag(:span, :class => ('icon icon-' << icon)) do end;
  link_text = icon << link_text
  
  content_tag(:li, :class => active_class) do
    link_to link_text, link_path
  end
end

end
