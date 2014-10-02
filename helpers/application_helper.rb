module ApplicationHelper
  def link_to(title, path)
    '<a href="' + path + '">' + title + '</a>'
  end

  def nice_date(new_date)
    new_date.strftime('%a, %b %d, %Y, %r')
  end
end
