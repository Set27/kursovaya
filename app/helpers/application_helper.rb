module ApplicationHelper
  def navbar_link_item(title:, path: nil)
    if path.nil?
      link_to title, '#', class: "nav-link disabled"
    elsif current_page?(path)
      link_to title, path, class: "nav-link active"
    else
      link_to title, path, class: "nav-link"
    end
  end
end
