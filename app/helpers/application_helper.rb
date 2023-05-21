module ApplicationHelper
  def smart_escape(str)
    CGI.escapeHTML(str)
  end
end
