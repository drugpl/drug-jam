module ApplicationHelper
  def localized(date, options = {})
    I18n.l(date, options) if date
    date
  end
end
