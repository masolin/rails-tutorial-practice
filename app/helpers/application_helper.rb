module ApplicationHelper
  # Return the full title on per-page
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Practice Sample App'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
