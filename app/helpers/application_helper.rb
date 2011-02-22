module ApplicationHelper
  def localized(date, options = {})
    I18n.l(date, options) if date
    date
  end

  def meta_title
    @meta_title || I18n.t('site.title')
  end

  def meta_description
    @meta_description || I18n.t('site.description')
  end
end
