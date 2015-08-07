module ApplicationHelper
  # Return the full title on per-page
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Practice Sample App'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  # Return flash content with alert
  def alert_flash
    return nil if flash.empty?
    result = ""
    flash.each do |msg_type, msg|
      result << content_tag(:div, class: "alert alert-#{msg_type}") do
        msg.html_safe <<
        content_tag(:button, "x", class: "close", "data-dismiss" => "alert")
      end
    end

    result.html_safe
  end
end
