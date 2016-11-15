module ApplicationHelper

  def format_date(date_str)
    format_str = "%m/%d/" + (date_str =~ /\d{4}/ ? "%Y" : "%y")
    date = Date.parse(date_str) rescue Date.strptime(date_str, format_str)
  end

end
