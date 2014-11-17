module ApplicationHelper
  def local_currency(num)
    " #{number_to_currency(num, locale: Settings.locale.to_sym)}"
  end
end
