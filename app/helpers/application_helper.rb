module ApplicationHelper

  def format_datetime(time)
    time.strftime("%B %d %Y")
  end

  def format_time(time)
    time.strftime("%H:%M %Z")
  end
end
