module ApplicationHelper
  def active_link(path)
    "active" if current_page?(path)
  end

  def prompts(notice, alert)
    content_tag(:div, content_tag(:p, notice), class: "alert alert-info") unless notice.blank?
    content_tag(:div, content_tag(:p, alert), class: "alert alert-danger") unless alert.blank?
  end
end
