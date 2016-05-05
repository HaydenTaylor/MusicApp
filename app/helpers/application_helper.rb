module ApplicationHelper

  def list_items(items)

    list = ""
    items.each do |item|
      list+=
      "<li>
          #{item}
      </li>"
    end

    "<ul>" + list + "</ul>"

  end


end
